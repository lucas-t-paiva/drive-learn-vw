from pathlib import Path

from pypdf import PdfReader, PdfWriter


SOURCE = Path("tmp/pdfs/iveco-daily-chassi.pdf")
OUTPUT = Path("public/assets/documents/modelos")
IMAGE_OUTPUT = Path("public/assets/images/modelos")
GROUPS = {
    "iveco-daily-30-160-ficha-tecnica.pdf": (0, 1),
    "iveco-daily-35-160-35-180-ficha-tecnica.pdf": (2, 3),
    "iveco-daily-45-160-45-180-ficha-tecnica.pdf": (4, 5),
    "iveco-daily-55-180-ficha-tecnica.pdf": (6, 7),
    "iveco-daily-65-180-ficha-tecnica.pdf": (10, 11),
}
HEROES = {
    "iveco-daily-30-160-oficial.webp": 0,
    "iveco-daily-35-160-35-180-oficial.webp": 2,
    "iveco-daily-45-160-45-180-oficial.webp": 4,
    "iveco-daily-55-180-oficial.webp": 6,
    "iveco-daily-65-180-oficial.webp": 10,
}


def main() -> None:
    reader = PdfReader(SOURCE)
    OUTPUT.mkdir(parents=True, exist_ok=True)
    for filename, pages in GROUPS.items():
        writer = PdfWriter()
        for page_index in pages:
            writer.add_page(reader.pages[page_index])
        with (OUTPUT / filename).open("wb") as stream:
            writer.write(stream)
        print(f"{filename}: {len(pages)} página(s)")

    IMAGE_OUTPUT.mkdir(parents=True, exist_ok=True)
    for filename, page_index in HEROES.items():
        hero = reader.pages[page_index].images[0].image.convert("RGB")
        hero.save(IMAGE_OUTPUT / filename, "WEBP", quality=92, method=6)
        print(f"{filename}: {hero.width} x {hero.height}px")


if __name__ == "__main__":
    main()
