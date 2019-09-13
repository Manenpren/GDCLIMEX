Bricsys lisp encryption tools

encryptconsole.exe encrypts one .lsp file or multiple .lsp files in a directory.

Usage:
    C:\dev\ddcad\thirdparty\encryption\encryptconsole.exe [-R] [-O] [-Xext1;ext2
] source [dest]

-R                Process directories recursively
-O                Overwrite existing files
-Xext1;ext2;ext3  Encrypt files with extensions ext1, ext2 or ext3.
                  If not specified, lsp is used.
source            The source file or directory
dest              The destination file or directory.

encryptgui.exe is the dialog version.
