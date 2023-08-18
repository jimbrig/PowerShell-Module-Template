# Module Resources

This folder contains resources for the module. "Resources" are any extra source code/files that are not functions
(which are located in the `Public` and `Private` source folders, respectively) that are not necessarilly part of the
module's core functionality, but provide additional functionality that may be useful to the user.

## Resource Types

This template currently supports the following possible resource types:

- **Classes** and **Enumerations** (used in the module)
- **Desired State Configuration** (DSC) Resources
- **Format** and **Type** `ps1xml` definition files
- **Images** (i.e. icons, logos, etc.)
- **Help** files (i.e. `about_` help files, module's `-Help.xml` `MAML` file, `Get-Help` examples, etc.)
- Tab **Completions** (i.e. `_*.ps1` files that define tab completions for the module or individual functions in the module)
- Custom Build **Tasks**
- Custom **Scripts**
- Custom **Configurations** (typically `psd1`, `JSON`, `ini`, or `YAML` files)

## Resource Folder Structure

The following is the recommended folder structure for the `Resources` folder:

```plaintext
Resources
├── Classes
├── Configurations
├── DSCResources
├── Enums
├── Formats
├── Help
├── Images
├── Scripts
├── Tasks
└── Types
```

## Resource Folder Descriptions

The following is a description of each of the resource folders:

### Classes

This folder contains any classes that are used in the module. Classes are typically used to define custom objects that
are used in the module. For example, if the module needs to define a custom object that is used in multiple functions
in the module, it is recommended to define a class for that object and place it in this folder.

### Configurations

This folder contains any custom configurations that are used in the module. Configurations are typically used to
define custom configurations that are used in the module. For example, if the module needs to define a custom
configuration that is used in multiple functions in the module, it is recommended to define a configuration for that
object and place it in this folder.

### DSCResources

This folder contains any custom DSC resources that are used in the module. DSC resources are typically used to define
custom DSC resources that are used in the module. For example, if the module needs to define a custom DSC resource that
is used in multiple functions in the module, it is recommended to define a DSC resource for that object and place it in
this folder.

### Enums

This folder contains any enumerations that are used in the module. Enumerations are typically used to define custom
enumerations that are used in the module. For example, if the module needs to define a custom enumeration that is used
in multiple functions in the module, it is recommended to define an enumeration for that object and place it in this
folder.

### Formats

This folder contains any format definition files that are used in the module. Format definition files are typically
used to define custom format definition files that are used in the module. For example, if the module needs to define a
custom format definition file that is used in multiple functions in the module, it is recommended to define a format
definition file for that object and place it in this folder.

### Help

This folder contains any help files that are used in the module. Help files are typically used to define custom help
files that are used in the module. For example, if the module needs to define a custom help file that is used in
multiple functions in the module, it is recommended to define a help file for that object and place it in this folder.

### Images

This folder contains any images that are used in the module. Images are typically used to define custom images that are
used in the module. For example, if the module needs to define a custom image that is used in multiple functions in the
module, it is recommended to define an image for that object and place it in this folder.

### Scripts

This folder contains any scripts that are used in the module. Scripts are typically used to define custom scripts that
are used in the module. For example, if the module needs to define a custom script that is used in multiple functions
in the module, it is recommended to define a script for that object and place it in this folder.

### Tasks

This folder contains any tasks that are used in the module. Tasks are typically used to define custom tasks that are
used in the module. For example, if the module needs to define a custom task that is used in multiple functions in the
module, it is recommended to define a task for that object and place it in this folder.

### Types

This folder contains any type definition files that are used in the module. Type definition files are typically used to
define custom type definition files that are used in the module. For example, if the module needs to define a custom
type definition file that is used in multiple functions in the module, it is recommended to define a type definition
file for that object and place it in this folder.

## Resource Folder Recommendations

The following are some recommendations for the `Resources` folder:

- **Do not** place any functions in the `Resources` folder. Functions should be placed in the `Public` or `Private`
  folders, respectively.
- **Do not** place any tests in the `Resources` folder. Tests should be placed in the root-level `Tests` folder for the project.
- **Do not** place any build scripts in the `Resources` folder. Build scripts should be placed in the root-level `Build`
  folder for the project.

## Resource Folder Notes

The following are some notes about the `Resources` folder:

- The `Resources` folder is not required. If the module does not have any resources, the `Resources` folder can be
  deleted.
- The `Resources` folder is not required to have any sub-folders. If the module does not have any resources that fit
  into the above categories, the `Resources` folder can be deleted.
- The `Resources` folder is not required to have any files. If the module does not have any resources that fit into the
  above categories, the `Resources` folder can be deleted.
