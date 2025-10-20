# Neovim/

<a href="https://dotfyle.com/IsWladi/neovim"><img src="https://dotfyle.com/IsWladi/neovim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/IsWladi/neovim"><img src="https://dotfyle.com/IsWladi/neovim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/IsWladi/neovim"><img src="https://dotfyle.com/IsWladi/neovim/badges/plugin-manager?style=flat" /></a>

## Install Instructions

> Install requires Neovim 0.11+. Always review the code before installing a configuration.

- Download the appimage

- Run the following commands:

  ```sh
  chmod u+x nvim-linux-x86_64.appimage
  mv nvim-linux-x86_64.appimage /usr/bin/nvim
  ```

- Clone the repository and install the plugins
  ```sh
  git clone git@github.com:IsWladi/Neovim ~/.config/nvim
  nvim
  ```

## Chrome extension - Vimium keymaps

```
    # Insert your preferred key mappings here.
    map t scrollDown
    map n scrollUp
    map f LinkHints.activateModeToOpenInNewTab
    map F LinkHints.activateMode
    map s nextTab
    map S previousTab
```

## Java Spring Boot Debugging

- Execute the API in debug mode:

  ```sh
  mvn spring-boot:run -Dspring-boot.run.jvmArguments="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=y,address=5005"
  ```

- Open the main class of the project to load LSP.
- Open the Controller class and set breakpoints.
- Initialize the debug in the main class (if you don't initialize at the main class, the debug will not work).
- Call the endpoint with the browser or Postman.
