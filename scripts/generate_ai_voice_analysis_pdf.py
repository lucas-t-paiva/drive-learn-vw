from pathlib import Path
from reportlab.lib import colors
from reportlab.lib.enums import TA_CENTER, TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import mm
from reportlab.platypus import (
    BaseDocTemplate, Frame, PageTemplate, Paragraph, Spacer, Table, TableStyle,
    PageBreak, KeepTogether
)

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "output" / "pdf" / "analise-assistente-voz-drive-learn.pdf"
OUTPUT.parent.mkdir(parents=True, exist_ok=True)

NAVY = colors.HexColor("#001E50")
BLUE = colors.HexColor("#007DB8")
CYAN = colors.HexColor("#00B0F0")
INK = colors.HexColor("#17253C")
MUTED = colors.HexColor("#65778B")
LIGHT = colors.HexColor("#F2F6F9")
LINE = colors.HexColor("#D8E2EB")
GREEN = colors.HexColor("#178A61")
RED = colors.HexColor("#B4282E")
BRL = 5.13

styles = getSampleStyleSheet()
styles.add(ParagraphStyle(name="TitleVW", parent=styles["Title"], fontName="Helvetica-Bold",
    fontSize=25, leading=29, textColor=NAVY, alignment=TA_LEFT, spaceAfter=8))
styles.add(ParagraphStyle(name="SubVW", parent=styles["Normal"], fontName="Helvetica",
    fontSize=11, leading=16, textColor=MUTED, spaceAfter=10))
styles.add(ParagraphStyle(name="H1VW", parent=styles["Heading1"], fontName="Helvetica-Bold",
    fontSize=17, leading=21, textColor=NAVY, spaceBefore=7, spaceAfter=9))
styles.add(ParagraphStyle(name="H2VW", parent=styles["Heading2"], fontName="Helvetica-Bold",
    fontSize=12, leading=15, textColor=BLUE, spaceBefore=6, spaceAfter=6))
styles.add(ParagraphStyle(name="BodyVW", parent=styles["BodyText"], fontName="Helvetica",
    fontSize=9.2, leading=13.4, textColor=INK, spaceAfter=6))
styles.add(ParagraphStyle(name="SmallVW", parent=styles["BodyText"], fontName="Helvetica",
    fontSize=7.5, leading=10.5, textColor=MUTED, spaceAfter=4))
styles.add(ParagraphStyle(name="CardNumber", parent=styles["Normal"], fontName="Helvetica-Bold",
    fontSize=18, leading=21, textColor=NAVY, alignment=TA_CENTER))
styles.add(ParagraphStyle(name="CardLabel", parent=styles["Normal"], fontName="Helvetica",
    fontSize=7.8, leading=10, textColor=MUTED, alignment=TA_CENTER))
styles.add(ParagraphStyle(name="TableHead", parent=styles["Normal"], fontName="Helvetica-Bold",
    fontSize=7.8, leading=9.5, textColor=colors.white))
styles.add(ParagraphStyle(name="TableCell", parent=styles["Normal"], fontName="Helvetica",
    fontSize=7.7, leading=10, textColor=INK))
styles.add(ParagraphStyle(name="TableCellBold", parent=styles["TableCell"], fontName="Helvetica-Bold"))
styles.add(ParagraphStyle(name="Quote", parent=styles["BodyVW"], fontName="Helvetica-Bold",
    fontSize=10, leading=15, textColor=NAVY, leftIndent=10, borderColor=CYAN,
    borderWidth=0, borderPadding=8, backColor=LIGHT))


def p(text, style="BodyVW"):
    return Paragraph(text, styles[style])


def money_brl(value):
    return "R$ {:,.2f}".format(value).replace(",", "X").replace(".", ",").replace("X", ".")


def money_usd(value):
    return "US$ {:,.2f}".format(value).replace(",", "X").replace(".", ",").replace("X", ".")


def table(data, widths, header=True, aligns=None):
    rows = []
    for ri, row in enumerate(data):
        style_name = "TableHead" if header and ri == 0 else "TableCell"
        rows.append([p(str(cell), style_name) for cell in row])
    t = Table(rows, colWidths=widths, repeatRows=1 if header else 0, hAlign="LEFT")
    commands = [
        ("VALIGN", (0, 0), (-1, -1), "MIDDLE"),
        ("GRID", (0, 0), (-1, -1), .45, LINE),
        ("LEFTPADDING", (0, 0), (-1, -1), 7),
        ("RIGHTPADDING", (0, 0), (-1, -1), 7),
        ("TOPPADDING", (0, 0), (-1, -1), 6),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
    ]
    if header:
        commands += [("BACKGROUND", (0, 0), (-1, 0), NAVY)]
        for ri in range(1, len(rows)):
            if ri % 2 == 0:
                commands.append(("BACKGROUND", (0, ri), (-1, ri), LIGHT))
    if aligns:
        for col, align in enumerate(aligns):
            commands.append(("ALIGN", (col, 1 if header else 0), (col, -1), align))
    t.setStyle(TableStyle(commands))
    return t


def page(canvas, doc):
    canvas.saveState()
    w, h = A4
    canvas.setFillColor(NAVY)
    canvas.rect(0, h - 12 * mm, w, 12 * mm, fill=1, stroke=0)
    canvas.setFillColor(colors.white)
    canvas.setFont("Helvetica-Bold", 8)
    canvas.drawString(18 * mm, h - 7.5 * mm, "DRIVE LEARN  |  ASSISTENTE DE VOZ E IA")
    canvas.setFillColor(MUTED)
    canvas.setFont("Helvetica", 7.5)
    canvas.drawString(18 * mm, 10 * mm, "Análise preliminar de viabilidade · 28 de julho de 2026")
    canvas.drawRightString(w - 18 * mm, 10 * mm, f"Página {doc.page}")
    canvas.restoreState()


doc = BaseDocTemplate(
    str(OUTPUT), pagesize=A4, rightMargin=18 * mm, leftMargin=18 * mm,
    topMargin=20 * mm, bottomMargin=17 * mm, title="Análise do Assistente de Voz e IA — Drive Learn",
    author="Lucas Paiva · Lux Solution"
)
frame = Frame(doc.leftMargin, doc.bottomMargin, doc.width, doc.height, id="normal")
doc.addPageTemplates(PageTemplate(id="vw", frames=[frame], onPage=page))

fresh_text = 4000 / 1_000_000 * 1.00 + 800 / 1_000_000 * 6.00
stt = 0.017
fresh_mvp = fresh_text + stt
tts_chars = 3200
tts = tts_chars / 1_000_000 * 15
fresh_premium = fresh_mvp + tts
monthly_questions = 40 * 30
cache_rate = .50
average_mvp = (1 - cache_rate) * fresh_mvp + cache_rate * stt
monthly_user_mvp = average_mvp * monthly_questions
average_premium = (1 - cache_rate) * fresh_premium + cache_rate * stt
monthly_user_premium = average_premium * monthly_questions

story = []
story += [
    Spacer(1, 12 * mm),
    p("Proposta técnica e financeira", "SubVW"),
    p("Assistente de voz e IA<br/>para o Drive Learn", "TitleVW"),
    p("Uma experiência do tipo “Fale comigo” para localizar treinamentos, explicar funções do veículo e responder dúvidas com base em conteúdo aprovado.", "SubVW"),
    Spacer(1, 7 * mm),
]
cards = [
    [p("40", "CardNumber"), p("30", "CardNumber"), p("1.200", "CardNumber"), p("3 min", "CardNumber")],
    [p("perguntas/dia por usuário", "CardLabel"), p("dias ativos/mês", "CardLabel"), p("interações/mês por usuário", "CardLabel"), p("duração média do vídeo", "CardLabel")],
]
ct = Table(cards, colWidths=[doc.width / 4] * 4, rowHeights=[15 * mm, 12 * mm])
ct.setStyle(TableStyle([("BOX", (0, 0), (-1, -1), .6, LINE), ("INNERGRID", (0, 0), (-1, -1), .6, LINE),
                        ("BACKGROUND", (0, 0), (-1, -1), LIGHT), ("VALIGN", (0, 0), (-1, -1), "MIDDLE")]))
story += [ct, Spacer(1, 8 * mm),
          p(f"<b>Conclusão executiva.</b> É tecnicamente viável e o primeiro MVP pode operar com voz sem pagar síntese de áudio: a pergunta é transcrita pela API, a resposta é gerada por um modelo econômico e o navegador/celular lê o texto em voz alta. Com 50% de reaproveitamento do histórico, a estimativa de API é de <b>{money_brl(monthly_user_mvp * BRL)} por usuário/mês</b>.", "Quote"),
          Spacer(1, 6 * mm),
          p("Recomendação", "H2VW"),
          p("Começar com um fluxo controlado: fontes aprovadas, respostas curtas, cache por pergunta e contexto, histórico completo, limite diário e aviso para uso com o veículo parado. A busca semântica e a validação administrativa podem ser ampliadas após medir as primeiras dúvidas reais."),
          Spacer(1, 5 * mm),
          p("Escopo desta estimativa", "H2VW"),
          p("Custos de API apenas. Não inclui impostos, spread cambial, hospedagem, armazenamento, desenvolvimento, monitoramento ou atendimento humano. Cotação de referência: US$ 1 = R$ 5,13 em 28/07/2026. Preços devem ser confirmados antes da contratação.") ,
          PageBreak()]

story += [p("1. Como a experiência funciona", "H1VW")]
flow = [
    ["Etapa", "O que acontece", "Como o custo é controlado"],
    ["1. Pergunta", "O usuário digita ou grava até 1 minuto.", "Texto não exige transcrição; voz é transcrita uma única vez."],
    ["2. Reaproveitamento", "A pergunta normalizada é comparada ao histórico e ao contexto atual.", "Pergunta idêntica reutiliza automaticamente. Pergunta semelhante só reutiliza resposta validada."],
    ["3. Recuperação", "O sistema localiza legendas, transcrições, vídeos publicados e especificações de modelos dentro do escopo do usuário.", "Somente pequenos trechos relevantes seguem para o modelo."],
    ["4. Resposta", "A IA recebe até 4.000 tokens e responde com até 800 tokens.", "Modelo econômico, instrução de não inventar procedimentos e limite diário."],
    ["5. Voz e registro", "O dispositivo lê a resposta e a interação fica registrada.", "Síntese nativa do navegador evita cobrança de TTS no MVP."],
]
story += [table(flow, [27*mm, 75*mm, 72*mm]), Spacer(1, 7*mm),
          p("Exemplo de diálogo", "H2VW"),
          p("<b>Motorista:</b> “Estou com dificuldade de entender a função V constante no Meteor.”<br/><b>Assistente:</b> oferece explicar ou abrir o treinamento; a explicação usa apenas a transcrição aprovada daquele conteúdo e identifica o modelo quando necessário.", "Quote"),
          p("Regra de segurança", "H2VW"),
          p("Se a fonte não for suficiente, a resposta deve declarar a limitação e direcionar ao vídeo ou à assistência técnica. O sistema não deve improvisar posições de botões, luzes do painel ou procedimentos operacionais."),
          PageBreak()]

story += [p("2. Premissas e preços utilizados", "H1VW")]
pricing = [
    ["Componente", "Premissa", "Preço unitário"],
    ["Modelo de texto", "GPT-5.6 Luna; 4.000 tokens de entrada e até 800 de saída", "US$ 1,00 / 1M entrada; US$ 6,00 / 1M saída"],
    ["Transcrição", "GPT-Realtime-Whisper; áudio de até 1 minuto", "US$ 0,017 / minuto"],
    ["Voz do MVP", "Speech Synthesis do navegador/celular", "Sem custo de API"],
    ["Voz premium opcional", "TTS-1; até cerca de 3.200 caracteres para 800 tokens", "US$ 15,00 / 1M caracteres"],
    ["Uso mensal", "40 perguntas/dia × 30 dias", "1.200 interações por usuário"],
]
story += [table(pricing, [39*mm, 91*mm, 44*mm]), Spacer(1, 7*mm),
          p("Custo máximo de uma pergunta inédita", "H2VW")]
question_cost = [
    ["Item", "US$", "R$"],
    ["Texto — 4.000 tokens de entrada", "0,0040", money_brl(.004 * BRL)],
    ["Texto — 800 tokens de saída", "0,0048", money_brl(.0048 * BRL)],
    ["Transcrição — 1 minuto", "0,0170", money_brl(stt * BRL)],
    ["Total MVP com voz nativa", f"{fresh_mvp:.4f}", money_brl(fresh_mvp * BRL)],
    ["TTS premium opcional", f"{tts:.4f}", money_brl(tts * BRL)],
    ["Total com TTS premium", f"{fresh_premium:.4f}", money_brl(fresh_premium * BRL)],
]
story += [table(question_cost, [91*mm, 39*mm, 44*mm]), Spacer(1, 6*mm),
          p("<b>Conservadorismo:</b> a conta considera o áudio sempre com 1 minuto e a resposta sempre no teto de 800 tokens. Na prática, respostas curtas tendem a reduzir o gasto.", "SmallVW"),
          PageBreak()]

story += [p("3. Estimativa mensal — MVP recomendado", "H1VW"),
          p("Cenário-base: 50% das perguntas reaproveitam uma resposta já armazenada. Perguntas de voz ainda passam pela transcrição; a geração do texto é evitada no cache. Voz de saída é feita pelo dispositivo."),
          table([
              ["Usuários ativos", "Perguntas/mês", "Custo de API (US$)", "Estimativa em reais"],
              *[[str(u), f"{u*monthly_questions:,}".replace(",", "."), money_usd(u*monthly_user_mvp), money_brl(u*monthly_user_mvp*BRL)] for u in [10,25,50,75,100]]
          ], [32*mm, 44*mm, 48*mm, 50*mm], aligns=["RIGHT"]*4),
          Spacer(1, 7*mm),
          p("Sensibilidade ao reaproveitamento", "H2VW")]
cache_rows = [["Cache", "Custo por usuário/mês", "100 usuários/mês", "Leitura"]]
for rate in [0, .3, .5, .7]:
    avg=(1-rate)*fresh_mvp+rate*stt
    per=avg*monthly_questions*BRL
    cache_rows.append([f"{int(rate*100)}%", money_brl(per), money_brl(per*100), "Mais respostas reutilizadas" if rate else "Tudo é resposta nova"])
story += [table(cache_rows, [27*mm, 49*mm, 49*mm, 49*mm]), Spacer(1, 7*mm),
          p("Comparativo com voz premium", "H2VW"),
          p(f"No mesmo cenário de 50% de cache, com TTS pago em todas as respostas inéditas e o teto de 800 tokens, o custo pode chegar a <b>{money_brl(monthly_user_premium*BRL)} por usuário/mês</b> ou <b>{money_brl(monthly_user_premium*BRL*100)} para 100 usuários</b>. Por isso, a voz nativa do dispositivo é a escolha recomendada para o MVP."),
          p("Se a intenção era 40 perguntas por usuário <b>por mês</b>, e não por dia, os valores de uso caem aproximadamente 30 vezes.", "SmallVW"),
          PageBreak()]

story += [p("4. Tratamento dos vídeos", "H1VW"),
          p("A IA não precisa assistir ao vídeo em toda pergunta. Cada conteúdo deve ser preparado uma vez e convertido em conhecimento consultável."),
          table([
              ["Origem", "Processamento recomendado", "Custo estimado por vídeo de 3 min"],
              ["YouTube com legenda", "Importar e revisar a legenda; gerar um resumo estruturado.", money_brl(fresh_text*BRL)],
              ["Arquivo local com áudio", "Transcrever 3 minutos; revisar; gerar resumo estruturado.", money_brl((3*stt+fresh_text)*BRL)],
              ["Vídeo já transcrito", "Salvar texto aprovado; nenhuma nova transcrição.", "Próximo de zero"],
          ], [47*mm, 86*mm, 41*mm]),
          Spacer(1, 7*mm),
          p("Exemplo de lote", "H2VW"),
          p("Em um acervo de 100 vídeos, metade com legenda pronta e metade exigindo transcrição de 3 minutos, o processamento inicial é estimado em aproximadamente <b>%s</b>. É um custo pontual; as perguntas posteriores consultam o texto armazenado." % money_brl((50*fresh_text+50*(3*stt+fresh_text))*BRL), "Quote"),
          p("Qualidade da fonte", "H2VW"),
          p("Antes da publicação, um responsável deve revisar nomes de funções, versões, localização de comandos e avisos. Legendas automáticas podem confundir siglas técnicas. A resposta precisa guardar a origem — vídeo, modelo e versão — para auditoria."),
          p("Vídeos sem transcrição", "H2VW"),
          p("O MVP permite colar a legenda do YouTube ou a transcrição de um vídeo local no cadastro. Uma etapa posterior pode automatizar a extração e criar uma fila de revisão administrativa."),
          PageBreak()]

story += [p("5. Dados, cache e governança", "H1VW")]
governance = [
    ["Controle", "Comportamento proposto"],
    ["Histórico individual", "Guardar pergunta, resposta, usuário, empresa, origem, tokens, duração do áudio, custo estimado, latência e data."],
    ["Cache exato", "Reutilização automática quando pergunta e contexto permanecem iguais."],
    ["Semelhança", "Reutilização somente de respostas previamente validadas e com alta similaridade; caso contrário, gerar nova resposta."],
    ["Escopo", "Respeitar as marcas, modelos, vídeos publicados e permissões visíveis ao usuário."],
    ["Atualização", "Mudança na fonte altera o hash de contexto e impede o uso silencioso de uma resposta antiga."],
    ["Privacidade", "Não enviar senhas, CPF/CNPJ, dados pessoais desnecessários ou conteúdo fora do escopo técnico."],
    ["Retenção", "Definir prazo para áudio bruto; preferencialmente descartá-lo após a transcrição e manter somente texto e metadados."],
]
story += [table(governance, [43*mm,131*mm]), Spacer(1,7*mm),
          p("Indicadores recomendados", "H2VW"),
          p("Perguntas por usuário, percentual de cache, custo por empresa, dúvidas sem resposta, vídeos mais citados, avaliações das respostas, tempo médio e taxa de encaminhamento à assistência."),
          p("Ponto de atenção", "H2VW"),
          p("Uma resposta gerada não deve tornar-se conhecimento confiável apenas por existir no histórico. A reutilização por similaridade deve depender de validação; perguntas idênticas podem usar cache contextual para eficiência."),
          PageBreak()]

story += [p("6. Arquitetura implementada no MVP", "H1VW"),
          table([
              ["Camada", "Entregue nesta versão"],
              ["Interface", "Botão “Fale comigo :)”, painel responsivo, digitação, gravação de até 60 segundos e leitura pelo dispositivo."],
              ["Fontes", "Vídeos publicados com descrição/legenda/transcrição e especificações dos modelos acessíveis ao usuário."],
              ["OpenAI", "Transcrição de áudio e geração de resposta via Responses API; modelos configuráveis por ambiente."],
              ["Persistência", "Base de respostas reutilizáveis e log completo de interações e custos estimados."],
              ["Proteções", "CSRF, permissão da biblioteca, limite diário de 40 perguntas, tamanho de áudio e resposta fundamentada."],
              ["Cadastro de vídeo", "Campo para legenda ou transcrição revisada, utilizado como fonte prioritária."],
          ], [44*mm,130*mm]),
          Spacer(1,7*mm),
          p("Próximos passos antes da produção", "H2VW"),
          p("1. Executar a migration na HostGator.<br/>2. Criar o arquivo <b>.env.ai</b> no servidor, fora do controle de versão, com a chave da API.<br/>3. Preencher e revisar transcrições dos vídeos prioritários.<br/>4. Testar permissões por empresa e marca.<br/>5. Definir retenção, moderação e responsável pela validação de respostas.<br/>6. Acompanhar o custo real por 30 dias e ajustar limites."),
          p("Fase seguinte sugerida", "H2VW"),
          p("Adicionar painel de curadoria para aprovar respostas, fila automática de transcrição de arquivos locais, busca vetorial/semântica, feedback “ajudou/não ajudou” e abertura direta do vídeo no ponto relevante."),
          PageBreak()]

story += [p("7. Fontes e observações finais", "H1VW"),
          p("<b>Documentação oficial OpenAI</b>", "H2VW"),
          p("Preços da API: <link href='https://openai.com/api/pricing/'>https://openai.com/api/pricing/</link><br/>Guia de áudio e fala: <link href='https://platform.openai.com/docs/guides/audio'>https://platform.openai.com/docs/guides/audio</link><br/>Responses API: <link href='https://platform.openai.com/docs/api-reference/responses'>https://platform.openai.com/docs/api-reference/responses</link>"),
          p("Os preços utilizados nesta análise foram consultados em 28/07/2026. A OpenAI pode alterar modelos, nomenclaturas e tarifas. O valor em reais oscila com o câmbio, IOF e cobrança do meio de pagamento.", "SmallVW"),
          Spacer(1,8*mm),
          p("Decisão recomendada", "H2VW"),
          p("Aprovar um piloto com até 10 usuários e conteúdo de maior recorrência. Manter a saída por voz do dispositivo, respostas curtas, 40 perguntas/dia como teto e cache validado. Após 30 dias, recalcular a média real de tokens, duração do áudio e percentual de reaproveitamento antes de ampliar a base.", "Quote"),
          Spacer(1,14*mm),
          p("Preparado para Drive Learn<br/>Lucas Paiva · Lux Solution", "SubVW")]

doc.build(story)
print(OUTPUT)
