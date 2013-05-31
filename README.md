Vagrant Cookbook
================
This cookbook installs vagrant, vagrant plugins, and vagrant boxes.

Requirements
============
This cookbook has only been used on Ubuntu 12.04 but has been tested
against other distros via test-kitchen.

Attributes
==========
#### vagrant::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['vagrant']['version']</tt></td>
    <td>String</td>
    <td>version of vagrant to install</td>
    <td><tt>1.1.5</tt></td>
  </tr>
  <tr>
    <td><tt>['vagrant']['version_hash']</tt></td>
    <td>String</td>
    <td>hash used in url to download appropriate version</td>
    <td><tt>64e360814c3ad960d810456add977fd4c7d47ce6</tt></td>
  </tr>
  <tr>
    <td><tt>['vagrant']['plugins']</tt></td>
    <td>Hash</td>
    <td>vagrant plugins to install</td>
    <td><tt>{}</tt></td>
  </tr>
  <tr>
    <td><tt>['vagrant']['boxes']</tt></td>
    <td>Hash</td>
    <td>vagrant boxes to install</td>
    <td><tt>{}</tt></td>
  <tr>
    <td><tt>['vagrant']['download_site']</tt></td>
    <td>String</td>
    <td>url to download vagrant package from</td>
    <td><tt>http://files.vagrantup.com/packages</tt></td>
  </tr>
</table>

Resource/Provider
=================

vagrant_plugin
--------------

# Actions

- :install: installs the vagrant plugin
- :uninstall: uninstalls the vagrant plugin

# Attribute Parameters

- name: name of the vagrant plugin
- version: version of the vagrant plugin to install
- source: not yet implemented
- user: user to install the vagrant plugin as - defaults to root

# Example

    # install the vagrant-berkshelf plugin
    vagrant_plugin "vagrant-berkshelf" do
      action :install
    end

    # install the vagrant-berkshelf plugin as user test
    vagrant_plugin "vagrant-berkshelf" do
      action :install
      user "test"
    end

vagrant_box
--------------

# Actions

- :add: adds a vagrant box 
- :remove: removes a vagrant box 

# Attribute Parameters

- name: name of the vagrant box 
- url: url of remote box 
- provider: provider to use for this box (ex. virtualbox) 
- user: user to install the vagrant box as - defaults to root

# Example

    # add the vagrant box lucid-32 
    vagrant_box "lucid-32" do
      action :add
    end

    # add the vagrant box lucid-32 as user test
    vagrant_box "lucid-32" do
      action :add
      user "test"
    end

    # remove the vagrant box lucid-32 as user test
    vagrant_box "lucid-32" do
      action :remove
      user "test"
    end

Usage
=====
#### vagrant::default
Includes the vagrant::pacakge recipe

#### vagrant::package
Downloads and installs vagrant

Contributing
============
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
===================
Authors: 

* Jim Rosser jarosser06@gmail.com

License:

Copyright 2013, Jim Rosser 

 Permission is hereby granted, free of charge, to any person obtaining
 a copy of this software and associated documentation files (the
 "Software"), to deal in the Software without restriction, including
 without limitation the rights to use, copy, modify, merge, publish,
 distribute, sublicense, and/or sell copies of the Software, and to
 permit persons to whom the Software is furnished to do so, subject to
 the following conditions:

 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
