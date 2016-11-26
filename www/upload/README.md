# Simple PHP upload

Simple PHP file-sharing cript. Modified to be used on a TP-Link MR3020, with OpenWRT Chaos Calmer. 
See: https://github.com/remipassmoilesel/chipbox

Based on: https://github.com/muchweb/simple-php-upload 
Thanks a lot !

## Installation

Just drop a PHP file in any directory, and adapt 'php.ini'

> :warning: **Security warning**: There is no limit on file size or file type. Please make sure that file permissions are set right so nobody can execute uploaded code. See [server configuration](#server-configuration) for examples.

On OpenWRT with lighttpd:

    $ cd /www
    $ wget https://github.com/remipassmoilesel/chipbox-simple-php-upload/archive/master.zip
    $ unzip master.zip
    $ chown -R http:www-data chipbox-simple-php-upload

## Configuration

There are few options that you can change by editing the file itself:


- Directory to store uploaded files

	`uploaddir` => `'.'`

- Display list uploaded files

	`listfiles` => `true`

- Allow users to delete files that they have uploaded (will enable sessions)

	`allow_deletion` => `true`

- Display file sizes

	`listfiles_size` => `true`

- Display file dates

	`listfiles_date` => `true`

- Display file dates format

	`listfiles_date_format` => `'F d Y H:i:s'`

- Randomize file names (number of 'false')

	`random_name_len` => `4`

- Keep filetype information (if random name is activated)

	`random_name_keep_type` => `true`

- Random file name letters

	`random_name_alphabet` => `'qwertyuiopasdfghjklzxcvbnm'`

- Display debugging information

	`debug` => `($_SERVER['SERVER_NAME'] === 'localhost')`


# php.ini configuration

    ;;;;;;;;;;;;;;;;
    ; File Uploads ;
    ;;;;;;;;;;;;;;;;
    
    ; Whether to allow HTTP file uploads.
    ; http://php.net/file-uploads
    file_uploads = On
    
    ; Temporary directory for HTTP uploaded files (will use system default if not
    ; specified).
    ; http://php.net/upload-tmp-dir
    ;upload_tmp_dir =
    
    ; Maximum allowed size for uploaded files.
    ; http://php.net/upload-max-filesize
    upload_max_filesize = 200M
    
    ; Maximum number of files that can be uploaded via a single request
    max_file_uploads = 20
