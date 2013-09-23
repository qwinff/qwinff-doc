============
Using QWinFF
============

QuickStart
==========

When you start QWinFF, you will see the **Main Window**. At the top of the Main
Window is the **Toolbar**, which contains most common operations you will need.
Below the Toolbar is the `Task List`_. The Task List is used to display all
conversion tasks. At the bottom-right corner, there is a **Start** button. At the
bottom of the window is the **Status Bar**.

The first thing to do is add some files to convert. You can do it by either
clicking on the **Add** button on the Toolbar or drag-and-drop files into the
Task List. After adding all files you want to convert, **Add Tasks Dialog**
will appear. You can select the output container format (**Convert To**) and
the output configuration (**Preset**). Then, select the desired output folder
and press **Finish**.

.. note:: You can select multiple files in the **Open File** dialog and add
   them all at once.

When you have added some tasks, click the Start button and the conversion will
start. Conversion progress of each task will be shown in the progress bar entry
in the Task List. After a task has finished, double-click on it to open the
output folder. If a conversion fails, you can view the error message by moving
the mouse pointer over the progress bar or right-click on the task and select
**Show Error Message**. 

Task List
=========

The task list shows all conversion tasks. Each task has some attributes like
*Source*, *Destination*, *Duration* and *Progress* shown in different columns.
You can reorder the columns by dragging the header items. Also it is possible
to select which columns to display by right-clicking on the header of the task
list. Available columns and their meaning are described as follows:

Source
   name of the input file

Destination
   name of the output file

Duration
   audio/video duration of the input file

Progress
   a progressbar showing the conversion progress

File Size
   size of the input file

Sample Rate
   audio sample rate (Hz) of the input file

Audio Bitrate
   audio bitrate (kb/s) of the input file

Channels
   the number of audio channels in the input file
   
Audio Codec
   audio codec name of the input file

Dimensions
   video width and height of the input file

Video Bitrate
   video bitrate (kb/s) of the input file

Framerate
   video frame rate (fps) of the input file

Video Codec
   video codec name of the input file

Add Tasks Dialog
================

The first section of the Add Tasks dialog is a list of files to be added. You
can click on the **Add** button to add more files or click on the **Remove**
button to remove files. When you are finished, click **Next** to enter the next
section.

The second section contains settings related to the output file.

Convert to
   This option contains a drop-down list with all possible output extensions.
   This is the *container format* of the output file.

Preset
   For each extension, there are one or more presets that defines the *codec*
   and parameters used to convert the file.

Output Path
   Select the output folder of the tasks. This setting only applies to the
   current tasks. You can select different output folder when you add other
   tasks later.

Output Path Settings
--------------------

.. versionadded:: 0.1.9

There are 3 choices of how the output folder is generated.

The first choice is **Select Folder**, which means you can assign a fixed
output folder. If you select this one, the tasks will be output to the folder
you choose.

The second choice is **Create new folder in source folder**. If you select this
option, a new folder will be created in the parent folder of each input file.
Each output file will be output to the new folder for its input file.

The third choice is **Output to source folder**. This option is similar to the
second one, except it doesn't create a new folder. Each output file is placed
in the same directory as its input file.

QWinFF automatically renames a output file if a file with the same filename
already exists in the output folder. You don't have to worry about overwriting
existing files.
