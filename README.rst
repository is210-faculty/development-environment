######################################
Student Development Environment Tookit
######################################

This project provides the resources to create a working development environment
for students in the Information Systems and Data Analytics programs at
the City University of New York School of Professional Studies(`CUNY SPS`_).

While the use of this toolkit is optional, students are nontheless strongly
encouraged to adopt it, where possible, as it will save considerable effort in
the creation and configuration of working development environme

.. note:

    Some students may have valid concerns about the *crutch effect* of using a
    pre-configured development environment. While such concerns are worth
    consideration, the tools with which you'll gain experience through using
    this environment are transferable to many contexts outside of the classroom
    and are now considered best-practices in modern development scenarios.

********
Overview
********

The Student Development Environment Toolkit is a virtualized development
platform comprised of several prominent technologies, seamlessly layered to
create a functional development experience.  While it would be beyond the scope
of this section to detail the various use-cases of each component, their use in
this project will be briefly outlined below.

VirtualBox
===========

The core of a virtualized development platform is a `virtual machine`_, which
is, in essence, a small operating system with its own users, networking, hard
drives, memory, etc living inside your primary operating hardware. The benefits
of using virtual machines for development include:

- Isolation and sandboxing of programs and developed code to prevent
  potentially dangerous or system-altering programs from harming the host
  computer.

- Providing access to tools that may not be available on the host os.

- Providing the ability to target code development on other operating systems
  (eg, if the code must be developed on a Windows machine but run on a Linux
  server).

In the case of this project, our `virtual machine`_ will be built upon the
`VirtualBox`_ virtualization platform. It's not the most performance-oriented
virtualization platform available, however, it is remarkably consistent across
various operating systems and versions and a favorite of developers across the
world.

Vagrant
=======

Though `VirtualBox`_ is the virtualization platform and must be installed for
this to work, you won't often interact with it directly. Instead, we'll be
using a tool called `Vagrant`_ to interact with our `virtual machine`_.
`Vagrant`_ is a modern tool for configuring and managing virtual machines in a
developer-centric manner.

In addition to the benefits of virtual machines listed above, `Vagrant`_ adds
two key benefits to the mix: *destructability* and *consistency*. Virtual
machines managed by `Vagrant`_ may be created or destroyed quickly and easily
and with a high degree of reliability that each new instance of a particular
virtual machine is, initially, exactly the same as the last.

In the context of your courses, you might find these attributes surprisingly
helpful in the event your early programs cause irrevocable changes to your
development environment. With `Vagrant`_ you can easily destroy the old
environment and create a new one on the fly.

Git
===

If you're reading this file, there's a good chance you've already installed
`Git`_ or have visited `GitHub`_. `Git`_ is an industry-leading `version control`_ software that
allows code and project assets to be worked-on in a collaborative fashion with
changes tracked and distributed through the tool.

Within the context of this project, the `Vagrant`_ configuration files that
instruct `Vagrant`_ how-to setup your new development environment are
distributed through `Git`_.

While it is possible to distribute and install these files without `Git`_,
Microsoft Windows users, in particular, may wish to use it as the Windows
`Git`_ installer includes several other helpful software packages for
interacting with `Vagrant`_.

Linux
=====

Lastly, the development environment itself is a version of the `Linux`_
operating system. Linux is the world's leading server operating system and is
the operating system of choice for many types of development especially with
open source tools such as `Python`_. Linux has recently also gained fame as the
world's leading mobile operating system as its many variants include
`Google Android`_.

In our case, the version of `Linux`_ being used is a low-memory variant of the
popular `Ubuntu`_ operating system known as `Lubuntu`_. While there are less
resource-intensive operating systems available, `Lubuntu`_ was chosen to
provide the easiest transition to those unfamiliar with such concepts as
`consoles`_ or `headless`_ computers.

************
Requirements
************

To run this development environment you must have at least:

- A computer on which you are an administrator

- 768MB of *free* memory

  To determine the amount of free memory available to your system, fully
  power off your computer (don't just suspend it).

  Now, turn on your computer, log-in, and wait for for about ten (10) minutes
  for all the normal software to load without explicitly starting up any other
  software. Now, follow the directions for your given operating system on
  determining available (unused) memory. These directions will vary from
  operating system to operating system.

  For example, Windows users may follow the following:

      http://windows.microsoft.com/en-us/windows7/view-how-much-memory-your-computer-is-using

  Whereas OS X users may follow this artcile:

      http://support.apple.com/en-us/HT2353

  Linux users may use the ``free`` command to list available memory.

- At least, 10GB of *free* hard-drive / disk space

  As with the memory requirements above, you should follow the directions
  specific to your operating systems.

  .. note:

      Virtual machines should **not** be installed on external devices like
      external hard drives, usb thumb-drives, or SD cards. If you don't have
      enough disk-space available, please move other files off of your main
      computer drive to your external media, to free up enough disk space for
      the virtual machine.

- A multi-core CPU

************
Installation
************

To install the Student Development Environment Toolkit, you must first
download and install the three primary software tools used to provision your
development environment.

.. note:

    Linux users will be able to get most of the listed software through their
    package managers and/or respective software centers. The broad range
    of available package management softwares make it difficult to provide
    direct support in this document. Please consult your Linux distribution's
    documentation on how to install `Git`_, `VirtualBox`_, and/or `Vagrant`_.

#.  Begin by following the directions to download the `Git`_ software from the
    `Git downloads page`.

    Students should follow the installation instructions for their operating
    system. Defaults are almost always fine and should be left as-is.

    .. note:

        Users of older versions of OS X may have some difficulty installing
        `Git`_. If you find yourself unable to proceed with this step and are
        unwilling or unable to upgrade to a more modern version of OS X, you
        may alternatively download the entire project as a single archive file
        from the `GitHub Releases`_ page.

#.  Next, install `VirtualBox`_ by visiting the `VirtualBox downloads page`_
    to download `VirtualBox`_.

    After downloading, install `VirtualBox`_ following the appropriate
    directions for your operating system and leaving the defaults as-is.

#.  Finally, install `Vagrant`_ by visiting the `Vagrant downloads page`_ to
    download `Vagrant`_.

    After downloading, install `Vagrant`_ following the appropriate directions
    for your operating system and leaving the defaults as-is.

***********************************
Getting the Development Environment
***********************************

At this point you have all of the tools necessary to create and run virtual
machines but haven't yet downloaded the CUNY SPS Student Development
Environment Toolkit. There are two options for downloading the environment,
each with specific strengths:

Git
===

The preferred way to download the Student Development Environment Toolkit is
through `Git`_. By doing so through `Git`_, any updates to the environment
issued by your instructor may be more easily integrated in the future. To
download the Student Development Environment Toolkit via `Git`_:

#.  Open a console or terminal window in the folder where you want to store
    your development environment. As was discussed in the requirements section,
    make sure this location has at least 10GB of free disk space.
    
    Mac OS X and Linux users may use the terminal (aka console) and the ``cd``
    command to navigate to the appropriate file or folder.

    Windows users can use Windows Explorer to go to the correct location and
    can right-click in the folder. Select the ``git bash`` option to open a
    console window.

#.  If you haven't already done so, set up your git username and email address
    as follows, replacing the name and email address appropriately.

    .. code:: console

        $ git config --global user.name "John Doe"
        $ git config --global user.email "john.doe@myemail.com"

    You'll only ever need to do this step once.

#.  Download the latest version of the Student Development Environment Toolkit
    from its `GitHub`_ repository.

    .. code:: console

         $ git clone https://github.com/is210-faculty/development-environment

    This will create a folder called ``development-environment`` on your
    filesystem and download the appropriate configuration files. To enter that
    folder, simply type:

    .. code:: console

        $ cd development-environment

Direct Download
===============

If you are unable to download the development environment via `Git`_, you may
visit the project's `releases page`_ on `GitHub`_ and downloading the most
recent version as a zipfile or tarball.

Unzip or untar the archive into your desired project folder.

**********************
Running the First Time
**********************

When you run your virtual machine the first time, it downloads your base
`Lubuntu`_ operating system then downloads, installs, and configures several
hundred additional pieces of software before the machine is ready to use.

.. warning:

    This process could take an hour or longer to set-up the first time and
    requires a fast, stable internet connection. Please be prepared to keep
    your computer on for the entire duration of the first run and make sure it
    won't fall asleep.

    It is **not** recommended that you have other programs running while the
    virtual machine is first being configured.

#.  Begin by opening a console in the same folder as your development
    environment. If you list the contents of the directory, you should see
    your ``VagrantFile``, eg:

    .. code:: console

        $ ls ./
        bootstrap  data  LICENSE  README.rst  salt  Vagrantfile

#.  From here, starting up your new environment is just as simple as typing:

    .. code:: console

        $ vagrant up

    At this point, Vagrant will start working to download and install your
    environment. Part-way through it will open a VirtualBox window with
    a generic command-line open on it but you can safely wait until you
    see a regular desktop login. Once you have a desktop (with a background and
    mouse response) in your VirtualBox window, you can start using your
    development environment.

*****************************************
Working With Your Development Environment
*****************************************

Working with your development environment in Vagrant is quite straightforward.
All commands are issued via the console from the same location as your
``Vagrantfile`` (exactly as with the first-run).

To start your development environment, type:

.. code:: console

    $ vagrant up

Similarly, to shut it down, type:

.. code:: console

    $ vagrant halt

If you have any need to destroy and re-create your sandbox environment, simply
type:

.. code:: console

    $ vagrant destroy

On the next ``vagrant up`` the environment will be restarted.

.. warning::

    On occasion, you may want to reboot your virtual machine either because
    you've received a prompt to do so or for personal reasons. Vagrant will
    not be able to recover from a reboot issued from inside the virtual
    machine. Instead, exit use the ``vagrant halt`` and ``vagrant up`` commands
    from your ``Vagrantfile`` directory to turn the machine off and back-on.

****************
User Credentials
****************

From your first Vagrant run you'll notice that the virtual machine is already
configured to automatically log you in. You may, however, have occasion to know
your username and/or password inside the virtual machine. These have not been
changed from the Vagrant defaults and are:

    username: vagrant
    password: vagrant

****************
Data Persistence
****************

If you take note of the contents of your ``development-environment`` folder,
you can see a folder called ``data``.

.. code:: console

    $ ls ./
    bootstrap  data  LICENSE  README.rst  salt  Vagrantfile

This folder stores all of the permanent data of your virtual machine. Any files
created by your user in your virtual machine will be saved in this folder and
accessible even when the virtual machine has been shut-down or destroyed.
Similarly, files placed in this folder will be available in your virtual
machine as soon as they're placed there.

**********
Conclusion
**********

If you've made it this far, you should have a fully-functioning development
environment. Try clicking around or running your first program and enjoy!

**********
References
**********

.. target-notes::

.. _`CUNY SPS`: http://sps.cuny.edu/
.. _`virtual machine`: https://en.wikipedia.org/wiki/Virtual_machine
.. _`VirtualBox`: https://www.virtualbox.org/
.. _`Vagrant`: https://www.vagrantup.com/
.. _`Git`: http://git-scm.com/
.. _`GitHub`: https://github.com/
.. _`version control`: https://en.wikipedia.org/wiki/Revision_control
.. _`Linux`: https://en.wikipedia.org/wiki/Linux
.. _`Google Android`: http://www.android.com/
.. _`Ubuntu`: http://www.ubuntu.com/
.. _`Lubuntu`: http://lubuntu.net/
.. _`consoles`: https://en.wikipedia.org/wiki/System_console
.. _`headless`: https://en.wikipedia.org/wiki/Server_%28computing%29
.. _`Git downloads page`: http://git-scm.com/downloads
.. _`VirtualBox downloads page`: https://www.virtualbox.org/wiki/Downloads
.. _`Vagrant downloads page`: https://www.vagrantup.com/downloads.html
.. _`releases page`: https://github.com/is210-faculty/development-environment/releases
