load("render.star", "render")
load("time.star", "time")

def main(config):
    # Messages that will cycle
    messages = [
        "COFFEE TIME!",
        "FUEL UP!",
        "BREW CREW",
        "CAFE VIBES",
        "ESPRESSO!",
        "DAILY GRIND",
        "SIP HAPPENS",
        "GRIND & SHINE",
    ]

    # Create frames for animation - one for each message
    frames = []

    for i, message in enumerate(messages):
        frame = render.Box(
            color = "#8B4513",  # Border color
            padding = 1,
            child = render.Box(
                color = "#2d1b00",  # Coffee brown background
                padding = 2,
                child = render.Column(
                    expanded = True,
                    main_align = "center",
                    cross_align = "center",
                    children = [
                        # Message
                        render.Text(
                            content = message,
                            color = "#FFD700",
                            font = "tom-thumb",
                        ),
                        # ASCII Coffee cup with beans on sides and handle
                        render.Column(
                            cross_align = "center",
                            children = [
                                render.Text(
                                    content = "o  ___  o",
                                    color = "#FFDEAD",
                                    font = "tom-thumb",
                                ),
                                render.Row(
                                    main_align = "center",
                                    children = [
                                        render.Text(
                                            content = "o ",
                                            color = "#5C4033",
                                            font = "tom-thumb",
                                        ),
                                        render.Text(
                                            content = "|   |",
                                            color = "#FFDEAD",
                                            font = "tom-thumb",
                                        ),
                                        render.Text(
                                            content = "D o",
                                            color = "#FFDEAD",
                                            font = "tom-thumb",
                                        ),
                                    ],
                                ),
                                render.Text(
                                    content = "o  \\_/  o",
                                    color = "#FFDEAD",
                                    font = "tom-thumb",
                                ),
                            ],
                        ),
                    ],
                ),
            ),
        )
        frames.append(frame)

    return render.Root(
        delay = 3000,  # 3 seconds per frame
        child = render.Animation(
            children = frames,
        ),
    )
