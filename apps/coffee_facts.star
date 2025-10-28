load("render.star", "render")
load("time.star", "time")

def main():
    # 15 coffee facts and trivia
    facts = [
        "Espresso means pressed out in Italian",
        "Coffee is the 2nd most traded commodity after oil",
        "Beethoven counted exactly 60 beans per cup",
        "Coffee was discovered by goats in Ethiopia",
        "A cup of coffee has more caffeine than espresso",
        "Finland drinks the most coffee per capita",
        "Coffee beans are actually seeds",
        "Decaf coffee still contains caffeine",
        "Coffee helped Olympic athletes in 1984",
        "The word coffee comes from Arabic qahwah",
        "Lighter roasts have more caffeine",
        "Coffee stays fresh for only 2 weeks after roasting",
        "Instant coffee was invented in 1901",
        "The most expensive coffee is from civet poop",
        "Coffee plants can live for 100 years",
    ]

    # Cycle through facts every 8 seconds
    now = time.now()
    fact_index = (now.unix // 8) % len(facts)
    current_fact = facts[fact_index]

    return render.Root(
        delay = 50,
        child = render.Box(
            color = "#1a0f00",
            child = render.Column(
                expanded = True,
                main_align = "space_around",
                cross_align = "center",
                children = [
                    # Title
                    render.Text(
                        content = "COFFEE FACT",
                        color = "#FFD700",
                        font = "tom-thumb",
                    ),
                    # Fact with marquee scrolling
                    render.Marquee(
                        width = 62,
                        child = render.Text(
                            content = current_fact,
                            color = "#F5DEB3",
                            font = "tom-thumb",
                        ),
                        offset_start = 62,
                        offset_end = -62,
                    ),
                    # Coffee emoji
                    render.Text(
                        content = "☕",
                        font = "6x13",
                    ),
                ],
            ),
        ),
    )
