# Note that since qtile configs are just python scripts, you can check for
# syntax and runtime errors by just running this file as is from the command
# line, e.g.:
#
#    python config.py

from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook

# The screens variable contains information about what bars are drawn where on
# each screen. If you have multiple screens, you'll need to construct multiple
# Screen objects, each with whatever widgets you want.
#
# Below is a screen with a top bar that contains several basic qtile widgets.
screens = [Screen(top = bar.Bar([
        # This is a list of our virtual desktops.
        widget.GroupBox(urgent_alert_method='text',fontsize=12,padding=0),

        # A prompt for spawning processes or switching groups. This will be
        # invisible most of the time.
        widget.Prompt(fontsize=12,foreground='00ffff'),

        # Current window name.
        widget.WindowName(fontsize=12),
        # widget.Volume(),
        # widget.Systray(),
    widget.Clock(
        '%Y%m%d',
        fontsize=13,
        padding=0,
        foreground='ffffff',
    ),
#    widget.Clock(
#        '%m',
#        fontsize=13,
#        padding=0,
#        foreground='ff0000',
#    ),
#    widget.Clock(
#        '%d',
#        fontsize=13,
#        padding=0,
#        foreground='ffff00',
#    ),
#    widget.Clock(
#        '%H%M',
#        fontsize=13,
#        foreground='00ff00',
#        padding=0,
#    ),
#    # widget.Clock('%Y-%m-%d %a %I:%M:%S %p',fontsize=12),
#    widget.Clock(
#        '%S',
#        fontsize=13,
#        padding=0,
#        foreground='00ffff',
#    ),
    ], 20),
    bottom = bar.Bar([
         widget.CPUGraph(
            graph_color='ff0000',
            fill_color='ff0000',
            background='800000',
            margin_x=0,
            border_width=0,
            line_width=1,
        ),
       widget.MemoryGraph(
            graph_color='ffffff',
            fill_color='ffffff',
            background='c0c0c0',
            margin_x=0,
            border_width=0,
            line_width=1,
        ),
        widget.NetGraph(
            graph_color='00ff00',
            fill_color='00ff00',
            background='008000',
            margin_x=0,
            border_width=0,
            line_width=1,
        ),
    ], 20)
)
]

# Super_L (the Windows key) is typically bound to mod4 by default, so we use
# that here.
mod = "mod4"

# The keys variable contains a list of all of the keybindings that qtile will
# look through each time there is a key pressed.
keys = [
    # Log out; note that this doesn't use mod4: that's intentional in case mod4
    # gets hosed (which happens if you unplug and replug your usb keyboard
    # sometimes, or on system upgrades). This way you can still log back out
    # and in gracefully.
    Key(["shift", "mod1"], "q",  lazy.shutdown()),

    Key([mod], "k",              lazy.layout.down()),
    Key([mod], "j",              lazy.layout.up()),
    Key([mod], "h",              lazy.layout.previous()),
    Key([mod], "l",              lazy.layout.previous()),
    Key([mod, "shift"], "k",  lazy.layout.shuffle_down()),
    Key([mod, "shift"], "j",  lazy.layout.shuffle_up()),
    Key([mod, "shift"], "space", lazy.layout.rotate()),
    Key(["mod1", "shift"], "space", lazy.layout.flip()),
    Key([mod, "shift"], "Return",lazy.layout.toggle_split()),
    Key(["mod1"], "Tab",         lazy.nextlayout()),
    Key([mod], "x",              lazy.window.kill()),
    Key([mod, "shift"], "r",     lazy.restart()),

    # interact with prompts
    Key([mod], "r",              lazy.spawncmd()),
    Key([mod], "g",              lazy.switchgroup()),

    # start specific apps
    Key([mod], "n",              lazy.spawn("firefox")),
    Key([mod], "Return",         lazy.spawn("gnome-terminal")),

    # Change the volume if your keyboard has special volume keys.
    Key(
        [], "XF86AudioRaiseVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB+")
    ),
    Key(
        [], "XF86AudioLowerVolume",
        lazy.spawn("amixer -c 0 -q set Master 2dB-")
    ),
    Key(
        [], "XF86AudioMute",
        lazy.spawn("amixer -c 0 -q set Master toggle")
    ),
    Key([], "XF86AudioPlay",
        lazy.spawn('qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause')),
    Key([], "XF86AudioNext",
        lazy.spawn('qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next')),
    Key([], "XF86AudioPrev",
        lazy.spawn('qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Prev')),

    # Also allow changing volume the old fashioned way.
    Key([mod], "equal", lazy.spawn("amixer -c 0 -q set Master 2dB+")),
    Key([mod], "minus", lazy.spawn("amixer -c 0 -q set Master 2dB-")),
]

# This allows you to drag windows around with the mouse if you want.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
        start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
        start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

# Next, we specify group names, and use the group name list to generate an appropriate
# set of bindings for group switching.
groups = []
for i in ["a", "s", "d", "f", "u", "i", "o", "p"]:
    groups.append(Group(i))
    keys.append(
        Key([mod], i, lazy.group[i].toscreen())
    )
    keys.append(
        Key([mod, "mod1"], i, lazy.window.togroup(i))
    )

# Two basic layouts.
layouts = [
    layout.Stack(
        stacks=3,
        border_width=1,
        border_focus='#ff0000',
        border_normal='#000000',
    ),
    layout.Stack(
        stacks=2,
        border_width=1,
        border_focus='#cccccc',
        border_normal='#000000',
    ),
    layout.Max(),
    layout.MonadTall(
        border_normal='#0000ff'
    ),
]

# vim: tabstop=4 shiftwidth=4 expandtab
