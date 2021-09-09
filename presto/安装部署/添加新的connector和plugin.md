
https://prestodb.io/docs/current/develop/spi-overview.html

In order to add a custom plugin to a Presto installation, create a directory for that plugin in the Presto plugin directory and add all the necessary jars for the plugin to that directory. For example, for a plugin called my-functions, you would create a directory my-functions in the Presto plugin directory and add the relevant jars to that directory.

By default, the plugin directory is the plugin directory relative to the directory in which Presto is installed, but it is configurable using the configuration variable catalog.config-dir. In order for Presto to pick up the new plugin, you must restart Presto.

Plugins must be installed on all nodes in the Presto cluster (coordinator and workers).