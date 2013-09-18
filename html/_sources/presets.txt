.. _presets:

=======
Presets
=======

Presets of QWinFF are written in :ref:`presets.xml <data_files>` in the program
installation directory. The format and structure of *presets.xml* is compatible
with the preset file of WinFF [#winff]_. This means you can copy any WinFF
preset to *presets.xml* and use it in QWinFF. In fact, most QWinFF presets are
taken from WinFF with little or no modification.

A preset contains the following fields:

label
  a descriptive name of the preset. example: ``WebM Generic``

params
  parameters to be passed to ffmpeg.
  example: ``-vcodec libvpx -acodec libvorbis -aq 90 -ac 2``

extension
  extension of the output file. example: ``webm``

category
  category of the preset. This field is reserved but currently unused by
  QWinFF. example: ``Websites``

The preset described above is then written in the preset file like this:

.. code:: xml

  <WebMGeneric>
    <label>WebM Generic</label>
    <params>-vcodec libvpx -acodec libvorbis -aq 90 -ac 2</params>
    <extension>webm</extension>
    <category>Websites</category>
  </WebMGeneric>

.. note:: The preset tag name (``WebMGeneric``) is chosen arbitrarily. Also,
  there is no need to make preset tag names unique. For example, it's OK to
  name all of them ``preset``.

It is better to include codec information in ``params`` (e.g. ``-vcodec
libvpx``), because QWinFF checks whether the installed ffmpeg supports the
codec. If any one of the ``-acodec`` or ``-vcodec`` isn't supported, the preset
will be hidden.

.. [#winff] http://winff.org
