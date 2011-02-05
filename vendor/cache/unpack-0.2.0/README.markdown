# Unpack*(er)* - *run files, run*

## What is Unpack?

Unpack makes it possible to unarchive rar and zip files using ruby.

You pass a directory and it will find all your archive files, unpack and remove them (if you want to).

## So how do I use it?

### Start by installing the gem

    sudo gem install unpack

Start `irb` and include the gem, `require 'unpack'`

## Working with a directory

### Unpack everything in the current directory

    $ Unpack.runner!
    => [#<Container:0x000001010ab458 @files=["dmd-tsa-cd2.avi"], @directory="/Downloads/Some.Super.Movie/CD2">]

### Unpack everything in another directory

    $ Unpack.runner!('/some/dir')
    => [#<Container:0x000001010ab458 @files=["some_files.mov"], @directory="/some/dir">]

### Unpack and delete archived file

    $ Unpack.runner!('.', remove: true)
    => [#<Container:0x000001010ab458 @files=["dmd-tsa-cd2.avi"], @directory="/Downloads/Some.Super.Movie/CD2">]
    $ Unpack.runner!('.', remove: true)
    => []

### Remove every archive file, even if nothing where unpacked

    $ Unpack.runner!('.', remove: true, force_remove: true)
    => []
    
### Unpack all archived file, but not deeper 3 folders down
    
    $ Unpack.runner!('.', depth: 3)
    => [#<Container:0x000001010ab458 @files=["dmd-tsa-cd2.avi"], @directory="/Downloads/Some.Super.Movie/CD2">]

### Unpack everything, even one file directories

To prevent you from unarchive files in folders that contains subtitles and other nonrelevant files, the folder must contain 5 archive files or more.

If you want to unpack everything, even subtitles directories, then you will have to specify the `min_files` option.

    $ Unpack.runner!('.', min_files: 0)
    => [#<Container:0x000001010ab458 @files=["english.str"], @directory="/Downloads/Subtitle/">]
    
## Working with one specific file

### Unpack a file
    
    $ Unpack.it!(file: 'zip/my_file.zip')
    => [#<Container:0x000001010ab458 @files=["file1", "file2"], @directory="/Downloads/my/files/zip">]
    
### Unpack a specific file, removing it when done 
    
    $ Unpack.it!(file: 'zip/my_file.zip', remove: true)
    => [#<Container:0x000001010ab458 @files=["file1", "file2"], @directory="/Downloads/my/files/zip">]
    
### Unpack a specific file and move the new files to a destination directory
    
    $ Unpack.it!(file: 'zip/my_file.zip', to: '/tmp')
    => [#<Container:0x000001010ab458 @files=["file1", "file2"], @directory="/tmp">]

## Some configure alternatives

### The *runner!* method

- ** :min_files ** (Integer) The minimum amount of files in the directory you want to archive the files in. *Default is 5*.
- ** :depth ** (Integer) The maximum folder depth. *Default is 2*.
- ** :debugger ** (Boolean) Prints some debug output into the console. *Default is false*.
- ** :force_remove ** (Boolean) Remove rarfiles, even if no files where unarchived. *Default is false*. **To get this to work you also have to set the `remove` option to true**.
- ** :remove ** (Boolean) Removes archived files after they have been used. *Default is false*.
- ** :absolute_path_to_unrar ** (String) The absolut path to the unrar binary. *Default is the [unrar](http://homepage.mac.com/pnoriega/unrar.html) binary that comes with the gem*.

### The *it!* method

- **:to** (String) The absolute or relative path to the destination directory. If nothing is defined, the *:file* path will be used.
- **:file** (String) The absolute or relative path to the archive file.
- **:remove** (Boolean) See the *runner!* method above
- **:absolute_path_to_unrar** (String) See the *runner!* method above
- **:debugger** (String) See the *runner!* method above

## What is being returned?

The `runner!` method returns an `Array` of `Container` instances. 
The `it!` method returns an instance of `Container`. 

These are the accessors of the `Container` class.

- **files** (String) The absolut path to the files that where unarchived.
- **directory** (String) The absolut path to the folder containing the files.

## This sounds supr, how do I help?

- Start by copying the project or make your own branch.
- Navigate to the root path of the project and run `bundle`.
- Start by running all tests using rspec, `autotest`.
- Implement your own code, write some tests, commit and do a pull request.

## Requirements

The gem is tested in OS X 10.6.6 using Ruby 1.9.2 and 1.8.7.

## Thanks to ...

- the [UnRarX](http://homepage.mac.com/pnoriega/unrar.html) team that provies the unrar binary.
- [NinoScript](https://github.com/NinoScript) that solved the console-escaping issue - [see this commit](https://github.com/oleander/Unpack/commit/dd7e46200a490c7af9fc5f770127291192a818f5).