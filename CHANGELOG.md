## [1.0.2](https://github.com/mcgilly17/Mosaic/compare/v1.0.1...v1.0.2) (2026-03-20)


### Bug Fixes

* **rainbow-indent:** re-enable and fix rainbow indentation ([af7231c](https://github.com/mcgilly17/Mosaic/commit/af7231c6af5f215b77f31f7074683779eb57198e))

## [1.0.1](https://github.com/mcgilly17/Mosaic/compare/v1.0.0...v1.0.1) (2026-03-17)


### Bug Fixes

* **alpha:** pass hidden file options to telescope pickers ([7eb0e85](https://github.com/mcgilly17/Mosaic/commit/7eb0e859979b7d61dbd504030e8e2a9ea3f9331b))
* **telescope:** show hidden files, fix keybindings, consolidate setup ([cc5ea7f](https://github.com/mcgilly17/Mosaic/commit/cc5ea7f53d1c4d007206cc5570b5dbe758ba0d53))

# 1.0.0 (2026-03-14)


### Bug Fixes

* add back in buffers group keymap after removing it from telescope ([0b6b0bf](https://github.com/mcgilly17/Mosaic/commit/0b6b0bf70f3308551aab24c06cd2c76a59558ad1))
* add rainbow delimiters and remove scope attribute ([2b70233](https://github.com/mcgilly17/Mosaic/commit/2b702334c2d013bb7b7f1dcb3c7888d65015e5f0))
* conform structure with multiple formatters ([0d7b4c0](https://github.com/mcgilly17/Mosaic/commit/0d7b4c09edfe18e10f2a7e52e34901da81cf43da))
* explicitly add webdevicons ([9e5402d](https://github.com/mcgilly17/Mosaic/commit/9e5402d75c7e9c45ca43e7f71969a273e75b5e6a))
* **flake:** let nixvim use its own tested nixpkgs version ([e3a80b8](https://github.com/mcgilly17/Mosaic/commit/e3a80b8b825dd7d379304f53d4b1801e72f2fd36))
* indentation ([ee29921](https://github.com/mcgilly17/Mosaic/commit/ee2992168d4c3cfff61e945e3216a06d3583e6a9))
* keymaps for trouble etc ([829f71a](https://github.com/mcgilly17/Mosaic/commit/829f71a92cef43ec78a4d98ff2f336719873dee2))
* moving most of the mkDefaults down into the actual values ([0ad2653](https://github.com/mcgilly17/Mosaic/commit/0ad26534fdcf492ac6e088ad4251b209cc29341c))
* **nixvim:** disable lazy plugin manager ([5726378](https://github.com/mcgilly17/Mosaic/commit/57263789b0a8e8794a79a2dfef316b70027693d0))
* **nixvim:** disable spectre plugin temporarily ([759a0b7](https://github.com/mcgilly17/Mosaic/commit/759a0b782dbebcc51be00c1f5bf2e1aadb76cdf8))
* **nixvim:** fix runtime errors and improve Lua code quality ([cdb4198](https://github.com/mcgilly17/Mosaic/commit/cdb4198c077421c281ca15b3f582aa0205c718e5))
* **nixvim:** migrate lspkind config to settings structure ([a842335](https://github.com/mcgilly17/Mosaic/commit/a842335ebd2a59531dc5932619aaac8046e13ac9))
* **nixvim:** migrate lspsaga config to settings structure ([7c1928f](https://github.com/mcgilly17/Mosaic/commit/7c1928fb95750d9f30913e5115239bbbfa037564))
* **nixvim:** use new treesitter folding config syntax ([e81edc8](https://github.com/mcgilly17/Mosaic/commit/e81edc8d850446c5a52d7d52d2e7ddd229cace57))
* **oil:** use snake_case settings to match oil.nvim API ([22e04e0](https://github.com/mcgilly17/Mosaic/commit/22e04e093ede096549b4b96ab274d557f9467699))
* Overlapping keymaps for spectre, text objects and conform ([bc4dff4](https://github.com/mcgilly17/Mosaic/commit/bc4dff4846dfdd5d2bed40f316540879b188821d))
* **project-nvim:** lazy load on UIEnter to fix telescope extension ([d107930](https://github.com/mcgilly17/Mosaic/commit/d107930fb55a2e67255d0baa8e53ebedc205174c))
* update names for fidget ([cbf8962](https://github.com/mcgilly17/Mosaic/commit/cbf89621adc6c84165044a6a39d4460083671455))
* Updating trouble commands ([b65faa6](https://github.com/mcgilly17/Mosaic/commit/b65faa608c8366ec212dc30b64f01b6b9bc16677))


### Features

* add autocommands for large files, spell check, and file reload ([433c5f4](https://github.com/mcgilly17/Mosaic/commit/433c5f4fc840f47070df4d803a58dcc7b5867e56))
* add nixd LSP for nix. ([f8a0deb](https://github.com/mcgilly17/Mosaic/commit/f8a0deb0973e33ad83abe7d1dd8e08331e945c92))
* add precognition plugin ([693f807](https://github.com/mcgilly17/Mosaic/commit/693f8079ba300230e585a039950b0c4b2b85a3dd))
* adding hop, removing illuminate ([13db125](https://github.com/mcgilly17/Mosaic/commit/13db125d08b57e44cafdbbace1e7ba0779e3d7d5))
* adding incremental selection and incremental rename ([8032c18](https://github.com/mcgilly17/Mosaic/commit/8032c18cb35bb86bf8da5d9c5d49c249c393f0d6))
* adding keymaps for Yanking with Hop and jumping nodes ([a9dc811](https://github.com/mcgilly17/Mosaic/commit/a9dc811561fe3fbfcb3203ceee6ab19206ccad47))
* adding rainbow indent backgrounds a la VSCode ([1d53afc](https://github.com/mcgilly17/Mosaic/commit/1d53afc7b361a25d48fe34a71fc54c4586c87eb9))
* all manually installed plugins are now enabled/disabled under plugs.PLUGIN-NAME.enable ([1de347f](https://github.com/mcgilly17/Mosaic/commit/1de347ff4811cf9781559e7f1ae005457b12cca2))
* **colorschemes:** add flash and grug-far catppuccin integrations ([cb69568](https://github.com/mcgilly17/Mosaic/commit/cb69568603785e50814fdbab04d433db7c2f57a9))
* **config:** add more keymaps and start testing modular implementation ([cf16bc4](https://github.com/mcgilly17/Mosaic/commit/cf16bc4eb21b0f4b6ad07ba4adfa262d581f9728))
* **config:** timeout and which-key config ([2dc5421](https://github.com/mcgilly17/Mosaic/commit/2dc5421d6ed7f4acf2c9b1f92b2b331343537533))
* configure keymaps for hop ([31c9365](https://github.com/mcgilly17/Mosaic/commit/31c9365eb0fd680188c23fe98cdc5783d27f73a0))
* **config:** Working on allowing Mosaic to be imported as an overlay to nix configs ([05d9189](https://github.com/mcgilly17/Mosaic/commit/05d918960429192650c9faf9c827138d5d3c8e21))
* disable eyeliner as I will be using hop ([eda0fed](https://github.com/mcgilly17/Mosaic/commit/eda0fed0f89589cae603eb95c2acf59a54b5c5c3))
* **lib:** add keymap helper functions ([d3cf689](https://github.com/mcgilly17/Mosaic/commit/d3cf689fc45017c5e8171a72fb6befbadec27985))
* **lsp:** add comprehensive diagnostic configuration ([81809bd](https://github.com/mcgilly17/Mosaic/commit/81809bd2f8242ea64d870b24a66d577c9d1c2977))
* making each plugin use mkDefault so they can be overwritten ([5328ad4](https://github.com/mcgilly17/Mosaic/commit/5328ad46cda4a6ee7f6b463c301dabb14656eefd))
* making more plugin settings overridable ([d9ff43c](https://github.com/mcgilly17/Mosaic/commit/d9ff43c7eee5f927aefbb65692b3e457b11a7918))
* nicer lualine configuration ([b2da543](https://github.com/mcgilly17/Mosaic/commit/b2da54386bc4a2d73038698fad06c7591a273187))
* **nixvim:** add Claude Code CLI integration ([d4d94ca](https://github.com/mcgilly17/Mosaic/commit/d4d94ca24ef0d5e4a734079c3d78052cf19124a6))
* **nixvim:** add keybindings for Claude diff accept/deny ([5dd2cdc](https://github.com/mcgilly17/Mosaic/commit/5dd2cdc03ef2fa9b8aeaa9f980a434af9c169d75))
* **nixvim:** implement lz-n lazy loading ([e5cdd11](https://github.com/mcgilly17/Mosaic/commit/e5cdd113a55142059d140f17157553282e7593ab))
* **plugins:** replace hop with flash.nvim ([d230ed3](https://github.com/mcgilly17/Mosaic/commit/d230ed33ed135dd12c79dfc50a197f2d96add8bb))
* **plugins:** replace spectre with grug-far ([570b87d](https://github.com/mcgilly17/Mosaic/commit/570b87d424214348d872eafad45d99a9106a8cf4))
* **refactor:** final keymaps moving ([b892683](https://github.com/mcgilly17/Mosaic/commit/b892683c4e53df1c9ddf5fb46aea5a8667581506))
* **refactor:** more tools moving to plugin files ([3565f76](https://github.com/mcgilly17/Mosaic/commit/3565f765a7d3b8bb6889734212e4527a079699b6))
* **refactor:** move conform keymaps to plugin file`` ([3e8b606](https://github.com/mcgilly17/Mosaic/commit/3e8b606a57c04f024552e7a64d59938ea6ad8d28))
* **refactor:** move debugging config to plugin file ([86c5c61](https://github.com/mcgilly17/Mosaic/commit/86c5c61884e8c543993eb2eed381a7ddf21f6e9f))
* **refactor:** move gitsigns keymaps into the plugin file ([b2db89a](https://github.com/mcgilly17/Mosaic/commit/b2db89acfe8945df315de6a7febd58a71ad250db))
* **refactor:** move harpoon, surround and text-object keymaps into plugin files ([a6324fe](https://github.com/mcgilly17/Mosaic/commit/a6324fed1f95b872795665ea529392b29a1f8027))
* **refactor:** move hop keymaps under the plugin file and make them ([d098c63](https://github.com/mcgilly17/Mosaic/commit/d098c6308d16b12330af90de65882101af216b67))
* **refactor:** move keymaps for LSP ([c2e1e12](https://github.com/mcgilly17/Mosaic/commit/c2e1e128b82ccc85939de83255301240ef8d600f))
* **refactor:** Move Markdown keymaps to plugin files ([c6e4f90](https://github.com/mcgilly17/Mosaic/commit/c6e4f90ff73b934247b5ade2ae55d3f89b92e5b7))
* **refactor:** move notify keymaps ([04ddc90](https://github.com/mcgilly17/Mosaic/commit/04ddc900fb6945fe1849075047c659eb007f3a6b))
* **refactor:** Move telescope keymaps to plugin file ([3976c6d](https://github.com/mcgilly17/Mosaic/commit/3976c6de8919dbfdd1b8d1c886603609159d9d67))
* **refactor:** Move trouble keymaps under plugin file ([2fcce11](https://github.com/mcgilly17/Mosaic/commit/2fcce11b0e8e461802580963034fc0c640bcf4cb))
* **refactor:** Moving buffer keymaps into general and bufferline keymaps back into a decentralised model ([0746c9c](https://github.com/mcgilly17/Mosaic/commit/0746c9cf2dcccdac19eabe774c0ce26ac08a6cb0))
* **refactor:** moving harpoon, undotree to plugin files. ([c36f23e](https://github.com/mcgilly17/Mosaic/commit/c36f23ed7aed35ee4278eacbd8d008600d2a24a4))
* **refactor:** Moving Oil keymap into plugin file and using whichkey instead ([fb82301](https://github.com/mcgilly17/Mosaic/commit/fb82301fcc313108d2261c0c0ca3040beec1679d))
* **refactor:** Moving Spectre and typescript tools under the plugin ([1f543fa](https://github.com/mcgilly17/Mosaic/commit/1f543fad68edb548fcce9be0eb598f5ff6f5a439))
* remove eyeliner as it is no longer needed ([22c2fcc](https://github.com/mcgilly17/Mosaic/commit/22c2fccaf61c9ce2d51c058ee8d7fd8e1f05a318))
* remove Lazygit. Testing a move to Fugit2. ([45b1cea](https://github.com/mcgilly17/Mosaic/commit/45b1cea1fff28a0be9777f3f064c6d19db1cffab))
* testing out a new structure for keymaps using libOptionals and mkIf. ([ab95b56](https://github.com/mcgilly17/Mosaic/commit/ab95b561e6414b35948170226cba75162c0697eb))
* trying to enable rainbow indent-blankline ([82eb9da](https://github.com/mcgilly17/Mosaic/commit/82eb9daa514ac27643b9bc35daca643892157d1d))
* turn off precognition by default ([737199d](https://github.com/mcgilly17/Mosaic/commit/737199d218096020dc52e4b7397131a23ee3e6d6))
* update alpha configs with more options ([76c28cf](https://github.com/mcgilly17/Mosaic/commit/76c28cf5bdc176712c35289506607c65ff9169a1))
* update lsp configs ([cd26952](https://github.com/mcgilly17/Mosaic/commit/cd26952c6ea3b718d010a92b1db037385a13e624))
