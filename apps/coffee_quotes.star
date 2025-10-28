load("render.star", "render")
load("time.star", "time")

def main():
    # Coffee quotes and wisdom
    quotes = [
        {"text": "COFFEE: BECAUSE ADULTING IS HARD", "author": ""},
        {"text": "ESPRESSO YOURSELF", "author": ""},
        {"text": "LIFE HAPPENS, COFFEE HELPS", "author": ""},
        {"text": "FIRST I DRINK THE COFFEE THEN I DO THE THINGS", "author": ""},
        {"text": "COFFEE IS A HUG IN A MUG", "author": ""},
        {"text": "RISE & GRIND", "author": ""},
        {"text": "DECAF? NO THANKS", "author": ""},
        {"text": "BUT FIRST, COFFEE", "author": ""},
        {"text": "POWERED BY CAFFEINE", "author": ""},
        {"text": "COFFEE: MY BLOOD TYPE", "author": ""},
    ]

    # Cycle through quotes based on time (changes every 10 seconds)
    now = time.now()
    quote_index = (now.unix // 10) % len(quotes)
    current_quote = quotes[quote_index]

    return render.Root(
        delay = 50,
        child = render.Box(
            color = "#1a0f00",  # Dark coffee brown
            child = render.Column(
                expanded = True,
                main_align = "space_around",
                cross_align = "center",
                children = [
                    # Top border
                    render.Box(
                        width = 64,
                        height = 2,
                        color = "#D2691E",
                    ),
                    # Quote text with scrolling
                    render.Marquee(
                        width = 60,
                        child = render.Text(
                            content = current_quote["text"],
                            color = "#F5DEB3",
                            font = "tom-thumb",
                        ),
                        offset_start = 60,
                        offset_end = -60,
                    ),
                    # Coffee emoji
                    render.Text(
                        content = "☕",
                        font = "6x13",
                    ),
                    # Bottom border
                    render.Box(
                        width = 64,
                        height = 2,
                        color = "#D2691E",
                    ),
                ],
            ),
        ),
    )
