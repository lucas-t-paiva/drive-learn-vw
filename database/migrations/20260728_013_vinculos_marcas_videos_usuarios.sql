-- Drive Learn VW - vínculos de marcas em vídeos e usuários
-- Execute após 20260725_012_recuperacao_senha_email.sql.
SET NAMES utf8mb4;

CREATE TABLE IF NOT EXISTS video_marcas (
    video_id BIGINT UNSIGNED NOT NULL,
    marca_id BIGINT UNSIGNED NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (video_id,marca_id),
    KEY idx_video_marcas_marca (marca_id,video_id),
    CONSTRAINT fk_video_marcas_video
        FOREIGN KEY (video_id) REFERENCES videos(id) ON DELETE CASCADE,
    CONSTRAINT fk_video_marcas_marca
        FOREIGN KEY (marca_id) REFERENCES marcas(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS usuario_marcas (
    usuario_id BIGINT UNSIGNED NOT NULL,
    marca_id BIGINT UNSIGNED NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id,marca_id),
    KEY idx_usuario_marcas_marca (marca_id,usuario_id),
    CONSTRAINT fk_usuario_marcas_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    CONSTRAINT fk_usuario_marcas_marca
        FOREIGN KEY (marca_id) REFERENCES marcas(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Recupera a marca dos vínculos já cadastrados por família.
INSERT IGNORE INTO video_marcas(video_id,marca_id)
SELECT DISTINCT vf.video_id,f.marca_id
FROM video_familias vf
JOIN familias f ON f.id=vf.familia_id;

-- Recupera a marca dos vínculos já cadastrados por modelo.
INSERT IGNORE INTO video_marcas(video_id,marca_id)
SELECT DISTINCT vm.video_id,f.marca_id
FROM video_modelos vm
JOIN modelos m ON m.id=vm.modelo_id
JOIN familias f ON f.id=m.familia_id;

-- Conteúdos gerais antigos permanecem vinculados à Volkswagen.
INSERT IGNORE INTO video_marcas(video_id,marca_id)
SELECT v.id,ma.id
FROM videos v
JOIN marcas ma
  ON ma.id=(
      SELECT m0.id
      FROM marcas m0
      WHERE m0.ativo=1
        AND (m0.slug IN('volkswagen-caminhoes-onibus','volkswagen-caminhoes-e-onibus')
             OR m0.nome LIKE 'Volkswagen%')
      ORDER BY m0.id
      LIMIT 1
  )
WHERE NOT EXISTS(
    SELECT 1 FROM video_marcas vm WHERE vm.video_id=v.id
);

-- Mantém o comportamento atual: usuários existentes recebem todas as marcas ativas.
INSERT IGNORE INTO usuario_marcas(usuario_id,marca_id)
SELECT u.id,ma.id
FROM usuarios u
CROSS JOIN marcas ma
WHERE ma.ativo=1;

CREATE TABLE IF NOT EXISTS schema_migrations (
    versao VARCHAR(100) NOT NULL PRIMARY KEY,
    aplicado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO schema_migrations(versao)
VALUES ('20260728_013_vinculos_marcas_videos_usuarios');
