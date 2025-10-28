load("render.star", "render")
load("time.star", "time")
load("math.star", "math")

def main():
    # Brew timer - 4 minute countdown (perfect for French Press!)
    # This cycles through a 4-minute countdown
    now = time.now()

    # 4 minutes = 240 seconds, cycle repeats
    cycle_seconds = 240
    seconds_in_cycle = now.unix % cycle_seconds

    # Countdown from 240 to 0
    remaining = cycle_seconds - seconds_in_cycle

    minutes = remaining // 60
    seconds = remaining % 60

    # Progress bar calculation
    progress_width = int((remaining / float(cycle_seconds)) * 60)

    # Color changes as time runs out
    if remaining > 180:
        color = "#00FF00"  # Green - plenty of time
        status = "BREWING..."
    elif remaining > 60:
        color = "#FFA500"  # Orange - getting close
        status = "BREWING..."
    elif remaining > 10:
        color = "#FF4500"  # Red-orange - almost done
        status = "ALMOST!"
    else:
        color = "#FF0000"  # Red - done!
        status = "READY!"

    return render.Root(
        delay = 100,
        child = render.Box(
            color = "#0a0a0a",
            child = render.Column(
                expanded = True,
                main_align = "space_evenly",
                cross_align = "center",
                children = [
                    # Title
                    render.Text(
                        content = status,
                        color = color,
                        font = "tom-thumb",
                    ),
                    # Timer display
                    render.Row(
                        expanded = True,
                        main_align = "center",
                        cross_align = "center",
                        children = [
                            render.Text(
                                content = "☕",
                                font = "6x13",
                            ),
                            render.Text(
                                content = " %d:%s%d" % (minutes, "0" if seconds < 10 else "", seconds),
                                color = color,
                                font = "6x13",
                            ),
                        ],
                    ),
                    # Progress bar
                    render.Box(
                        width = 60,
                        height = 4,
                        color = "#333333",
                        child = render.Box(
                            width = progress_width,
                            height = 4,
                            color = color,
                        ),
                    ),
                    # Instruction text
                    render.Text(
                        content = "FRENCH PRESS",
                        color = "#8B4513",
                        font = "tom-thumb",
                    ),
                ],
            ),
        ),
    )
