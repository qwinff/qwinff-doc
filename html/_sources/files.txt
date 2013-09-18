.. _files:

=====
Files
=====

Installation Directory
======================

Installed files are placed differently on different platforms. On GNU/Linux,
the program executable is installed in ``<prefix>/bin`` and data files are
installed in ``<prefix>/share/qwinff``. The ``<prefix>`` part depends on the
packager, and the most common prefix is ``/usr``. On Microsoft Windows, all
files, including the executable file and data files, are placed in the
installation directory you choose, and the default is ``C:\Program Files
(x86)\QWinFF`` or ``C:\Program Files\QWinFF``.

.. _data_files:

Data Files
==========

The contents of the data directory are described as follows:

presets.xml
  This file contains ffmpeg presets. See :ref:`presets` for details about the
  preset file format.

constants.xml
  This file contains some pre-defined values used by the program.  It is read
  once on program startup. The function of each entry is documented using xml
  comments in the file.  QWinFF won't start if errors or incorrect values are
  detected in this files, so modify this file with care.

translations/
  This directory contains translation files (``*.qm``) for the program.
  Translation files should be named as
  ``qwinff_<language-code>_<country-code>_.qm``. For example, translation file
  for Chinese (Taiwan) should be named ``qwinff_zh_TW.qm``.

`*.dll`
  (Windows only) Dynamic libraries the program depends on.

tools/
  (Windows only) This directory contains external tools used by the program,
  including ``ffmpeg.exe``, ``ffprobe.exe``, ``sox.exe`` and other supporting
  tools/libraries.

Settings File
=============

Program settings are saved separately for each user. On GNU/Linux, the settings
file is ``~/.qwinff/qwinff.ini``. The installed version on Windows saves the
settings in ``.qwinff\qwinff.ini`` in the user's home directory, while the
portable version saves the settings in ``qwinff.ini`` in the program directory.
