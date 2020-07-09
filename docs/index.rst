
.. documentation master file, created by
   sphinx-quickstart on Fri Jul 19 20:26:50 2019.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to dt-device-proxy documentation!
=========================================

.. toctree::
   :maxdepth: 1
   :caption: Contents:


The ``dt-device-proxy`` module provides a user-friendly routing of the resources
available on a device as RESTful APIs. In a nutshell, it allows us to hide some
implementation details of a RESTful API from the end user.

As you know, a RESTful API are (usually) implemented as HTTP endpoints thus serve
HTTP requests received on a TCP port. A given TCP port can be used by only one
application at a time, thus multiple APIs can coexist only if they work on different
ports. For example, the API ``dt-device-health``, which provides health information
about a device, works on the TCP port 8085, thus if you want to fetch health information
you can visit the URL ``http://HOSTNAME:8085/`` in your browser, where ``HOSTNAME`` is
the name of your device. Clearly, this is not user friendly given the fact that we
need to know which port services are on.

This module remaps all device's APIs to user friendly URLs. For example, the
``dt-device-health`` API above can be accessed at the URL ``http://HOSTNAME/health``.

Note: The ``dt-device-proxy`` module is the only module in Duckietown that is allowed
to bind to the TCP port ``80`` (default HTTP port).


Proxied APIs
------------

A list of APIs proxied by this module follows:


dt-device-dashboard
~~~~~~~~~~~~~~~~~~~

This is not a RESTful API but the device Dashboard, available on the TCP port ``8080``
it is proxied to the URL
``http://HOSTNAME/dashboard/`` (shortcut ``http://HOSTNAME/d/``).


dt-device-online
~~~~~~~~~~~~~~~~

Module providing information about active internet connections on the device and
gateway between the device and the Duckietown community. Available on the TCP
port ``8081`` it is proxied to the URL
``http://HOSTNAME/world/`` (shortcut ``http://HOSTNAME/w/``).


dt-files-api
~~~~~~~~~~~~

Module providing access to the device's file system via RESTful API.
Available on the TCP port ``8082`` it is proxied to the URL
``http://HOSTNAME/files/`` (shortcut ``http://HOSTNAME/f/``).


dt-ros-commons
~~~~~~~~~~~~~~

Module providing (among other things) an API through which information about
the current ROS network can be fetched. Available on the TCP
port ``8084`` it is proxied to the URL
``http://HOSTNAME/ros/`` (shortcut ``http://HOSTNAME/r/``).


dt-device-health
~~~~~~~~~~~~~~~~

Module providing information about the software/hardware health of a device.
Available on the TCP port ``8085`` it is proxied to the URL
``http://HOSTNAME/health/`` (shortcut ``http://HOSTNAME/h/``).


portainer
~~~~~~~~~

Similarly to the ``dt-device-dashboard`` module, this is not an API but a web-based
user interface to Docker called Portainer (https://www.portainer.io/).
Available on the TCP port ``9000`` it is proxied to the URL
``http://HOSTNAME/docker/`` (shortcut ``http://HOSTNAME/k/``).
