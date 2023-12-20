`Beginners advice, you dont need to know all these command just use the CALL AS A SERVICE (CAAS) model.`

a video or a gitbook/blog soon

Code/use as you learn
# Easy to go noob.md for the all over your vim/nvim

So practically here I am giving all the most important guide and instead of spending time surfing around for a certain command, you can certainly check it here

So get it right you can edit all the cmd to your desire taste but if you are using my setup here, then these will work and it is a good guide also


NVIM_TREE
============
We create a file from our nvim_tree pane with `a` and there are different thing that can be done on the nvim_tree pane also ranging from creating new folder/file to deleting it. Most importantly make sure to check where the new file or folder is created to before creating it. 

A folder can be created if you add `/` at the end of the name you want to create it with.

You open file with `o` or with `enter` when you are on the file directory.

You can call your nvim_tree with `(C-n) also known as ctrl n` 

For navigating with on your nvim and the tree, you can use `C-h`


If you need other thing go check the cheatsheet here [cheatsheet](https://github.com/nvim-tree/nvim-tree.lua)


CMD that works
=================
Customizing your theme is easy and you can just easily change your theme with `<leader>th`

`(C-z)` will take you to the terminal and we call it suspended mode, you can use `fg` to access you buffer back.

To open folders without using the nvim-tree, `<leader>sB` comes in handy and effective.

To close a opened buffer we use `<leader>x` or `:bd`, but the other is more effective.

`Most importantly make sure you are in the command mode for all these to work, they wont work if you are not on the command mode`

For Navigating aorund command mode, you can either use `esc` or by using `(C-c)`.

We have `j, k ,l and h` the navigator and getting all things in directions done, just press it to figure out which one move up, down and sideways. Understand that you can also make use of `B,W,J,K,L,H` in a way that it fastforwards word and also takes it to the back also faster but we are going steadily easy peasy. Also remember that your arrow keys work also and can be actively used for navigation.(addition of number to the navigation key cna aid fast movement also and help in navigating faster like `50 j` will move 50 line downward)

Split working is available also ranging from horizontal or vertical, we use `vsplit` to split vertically and `split` to get work done horizontally.

We save our newly written file with `:w`  and quit with `:q` or maybe hard quit `:q!`.

For easy access to the front of a page or the last of a page, we can click `gg` in small and `GG` in caps for navigating both beginning and ending of a line, also you can type a page nos you are looking for when trying to, for example if i am going to page 50 on my terminal i did just press `:50` and get navigated as fast as possible

Also, if you dont have tmux you can use nvim term and also you can work with your terminal by adding the `!` mark, for instance checking git status will be `:!git status`. Even though I will prefer working alongside withe tmux to get all things done easier and faster accordingly.

You can navigate through your opens file window with `(C-i)` or also using the cmd `:bn` and `:bp` where the `n` is next and the `p` is previous.

`Most importantly make sure you are in the visual mode for all these to work, they wont work if you are not on the visual mode.`

On visual mode we can copy, cut, paste and delete, copying the selected word on visual mode is called yanked and works by clicking `y` on your keyboard. 

You can cut a selected text by clicking `d` once and get it pasted with `p`. 

Regarding multityping and multiple line commenting on code, I think it varies depending on where you download your setup from but these setup uses `gc` or `gd`.

For multityping you highlight the required lines and`shift ;` then it displays some strings you can then follow it by `s/what-you-are-changing/the-new-changes`(these is written together with the string displayed in the insert command line). You can check for direction on youtube if these is not explainatory enough.

Going to definition, you are going to use `ctrl ]` after highlighting the necessary string.

`Accessing floating, vertical and horizontal terminal`

You can use `<leader> h or v` for accessing both vertical and horizontal and you can use `C-t` for accessing the floating terminal.

`<leader>pt` is used to show hidden/opened terminal.

There is a mapping cheatsheet that can be accessed with `<leader>ch` and there are other things that you can check.

## Key Important Note
- We have atleast different types of mode and some of them are visual, normal, command and insert. These mode varies on what you are trying to do.
        - the normal mode (n) is everyone default mode
        - the command mode is used to run all the command
        - the visual mode (v) is just a read-only mode, you can get things selected and later yanked (also known as copy in the real world) on these mode.
        - the insert mode is just the insert mode, the mf write mode.

- if you are using my setup here, it do come with telescope and `(caps-lock)n(underscore)vim`tree, if you are building from scratch you can get telescope for finding files or those things called directory.

- We do have stuff called jobs (it is practically you minimizing you app on your andriod), and you can certainly get back to them for sure. Don't let that bug you cause it may not be useful later on.

## Some things in CMD mode
 An easy way to remember, pka `d` as Delete and `c` as Change, `w` as Forward and `b`

`dt` and `ct` followed by the lettering or symbol you want to delete can be helpful also, it will equally delete of change to the side. 

 Double `d` can be used to delete a line and `dw` can be used to delete a word.

`cw` can also be used to delete and takes you to insert mode immediately.

`*` for moving through highlighted words

`o` for below taking you to new line and `O` for above taking you to new line, also you get to be in insert mode also.

 yanking a line with `yy`, you can yank a word with `ye`, you can yank matching sequence with `y%`.


 deleting a line with `dd`, you can delete a word with `de`, you can delete matching sequence with `d%`.
 
 `zz` to centre your cursor.
 
 `A` takes you to the end of the line while `0` takes you to the beginning of a line and capital `I` to the beginning and putting in insert mode.

 `x` delete a letter, and you add nos to the back also for more deleting.

## Just there CMD

