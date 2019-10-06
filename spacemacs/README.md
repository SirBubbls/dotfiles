# Python
## Requirements
`pip3 install flake8 pylint mypy**

**Setup Python Executable**

```lisp
  (setq flycheck-python-flake8-executable "python3")
  (setq flycheck-python-pycompile-executable "python3")
  (setq flycheck-python-pylint-executable "python3")
```

## Downloads
### Anaconda3
**Graphical Installers**

MacOS: https://repo.anaconda.com/archive/Anaconda3-2019.07-MacOSX-x86_64.pkg

Windows: https://repo.anaconda.com/archive/Anaconda3-2019.07-Windows-x86_64.exe

Linux: https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh

**CLI Installers**

MacOS: https://repo.anaconda.com/archive/Anaconda3-2019.07-MacOSX-x86_64.sh

## Installation
### Windows
In your `.spacemacs` `user-config` add the path to the Anaconda directory.

```
(setenv "WORKON_HOME" "C:/Users/Lucas/Anaconda3/")
```

#### Environment Variables
Following Path Variables need to be set.

`C:\Users\Lucas\Anaconda3\`

`C:\Users\Lucas\Anaconda3\Scripts\`

`C:\Users\Lucas\Anaconda3\Library\bin`
