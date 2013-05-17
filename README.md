vagrant Cookbook
================
This cookbook installs vagrant, vagrant plugins, and vagrant boxes.

Requirements
------------
This cookbook has only been used on Ubuntu 12.04 but has been tested
against other distros via test-kitchen.

#### packages
- `vagrant` - vagrant package 

Attributes
----------
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
    <td><tt>['vagrant']['download_site']</tt></td>
    <td>String</td>
    <td>url to download vagrant package from</td>
    <td><tt>http://files.vagrantup.com/packages</tt></td>
  </tr>
</table>

Usage
-----
#### vagrant::default

Just include `vagrant` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[vagrant]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 

* Jim Rosser jarosser06@gmail.com
