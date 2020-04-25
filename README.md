# Platformer

As the name suggests, this is a generic platformer I made over a couple of weeks while becoming acquainted with the [godot engine](https://godotengine.org/). A large chunk of the game was made following a great free [tutorial](https://www.youtube.com/watch?v=Mc13Z2gboEk) by GDQuest. 

Other than having reading through the [official gdscript style guide](https://docs.godotengine.org/en/stable/getting_started/scripting/gdscript/gdscript_styleguide.html) I went in blind. In the (admittedly sparse) commit messages you can see the natural progression of my understanding of the engine, editor, and scripting language.

## Prerequisites to run locally: 
- If you want to clone the repo: `git` and `git lfs` (unless you want to download the zip)
- godot 3.2


## FAQs:

1. Why godot?
   - **tl;dr**: I found Unity alright, but I wanted to try something new.
   - longer version: I want to make games, and I have a little experience with Unity (a few tutorials and some tinkering), but it never really clicked with me for a variety of reasons. I was going to give it another shot, but then I did a bit of research and saw a lot of buzz about godot, so I did a bit more research and decided it was well suited for me: 
     - godot is open source and free: free as in "freedom" and free as in "free beer"
     - though smaller than Unity's, godot's community is quite active and its devs are responsive
     - its node-based workflow makes a lot of intuitive sense to me
     - its focus on events (signals) greatly reduces coupling between nodes
     - its ui/ux is less cluttered than Unity's
     - while at first I didn't love gdscript, I've grown to appreciate its simplicity
     - **most importantly of all, it has a dark theme**

1. I cloned the repo without having git lfs installed and now the game assets aren't loading. What do I do now?
   - Install [git lfs](https://git-lfs.github.com/), then use `git lfs get`
   - Alternatively, see [this issue](https://github.com/git-lfs/git-lfs/issues/325)


 ## Attributions

- I followed [GDQuest's excellent tutorial](https://www.youtube.com/watch?v=Mc13Z2gboEk) while building this game. I tried to strike a balance between following along and doing my own thing, as can be evidenced by the inclusion of lighting, sound effects, background music, and several meh animations.
- All graphical assets were provided by [GDQuest](https://github.com/GDQuest/godot-beginner-2d-platformer/releases/tag/1.1.0) 
- All sound assets come from [kenney.nl](https://kenney.nl/)
