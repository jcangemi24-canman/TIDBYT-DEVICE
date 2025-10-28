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
            color = "#2d1b00",  # Coffee brown background
            child = render.Column(
                expanded = True,
                main_align = "space_evenly",
                cross_align = "center",
                children = [
                    # Top border
                    render.Box(
                        width = 64,
                        height = 1,
                        color = "#8B4513",
                    ),
                    # Spacer
                    render.Box(height = 2),
                    # Message
                    render.Text(
                        content = message,
                        color = "#FFD700",
                        font = "tom-thumb",
                    ),
                    # Spacer to move cup up
                    render.Box(height = 2),
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
                    # Bottom border
                    render.Box(
                        width = 64,
                        height = 1,
                        color = "#8B4513",
                    ),
                ],
            ),
        )
        frames.append(frame)

    return render.Root(
        delay = 3000,  # 3 seconds per frame
        child = render.Animation(
            children = frames,
        ),
    )
