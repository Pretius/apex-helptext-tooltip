# Pretius APEX Help Text Tooltip
##### Oracle APEX dynamic action plugin v1.0
The plugin overrides native APEX help text presentation layer (inline dialog) with tooltips in Oracle APEX 5 and Universal Theme. The tooltip can be aligned using 24 positions and it can indicate item, item label and item help button.

## Preview
![Alt text](/preview.gif?raw=true "Preview")

## Table of Contents
- [License](#license)
- [Demo Application](#demo-application)
- [Features at Glance](#features-at-glance)
- [Roadmap](#roadmap)
- [Install](#install)
  - [Installation package](#installation-package)
  - [Install procedure](#install-procedure)
- [Usage guide](#usage-guide)
- [Changelog](#changelog)
  - [1.0](#10)
- [About Author](#about-author)
- [About Pretius](#about-pretius)
- [Free support](#free-support)
  - [Bug reporting and change requests](#bug-reporting-and-change-requests)
  - [Implementation issues](#implementation-issues)
- [Become a contributor](#become-a-contributor)
- [Comercial support](#comercial-support)

## License
MIT

## Demo Application
[http://apex.pretius.com/apex/f?p=PLUGINS:HELPTEXT](http://apex.pretius.com/apex/f?p=PLUGINS:HELPTEXT)


## Features at Glance
* The plugin is compatible with Oracle APEX starting from version 5.0.
* The plugin was tested under three major browsers: Internet Explorer 10+, Firefox, Chrome.
* 24 positions when aligned to item or item label
  * 6 positions with 3 position modifiers (start, middle and end of the element)
  * 6 positions without modifiers
* 12 positions when aligned to item help button
* posibility to bind 3 events: hover, focus, click for button and APEX item
* true action affected elements supports:
  * Items(s) - specify APEX items by names separated with colon
  * Region - all items contained within region are bound
  * jQuery selector - specify APEX items by existing jQuery selector, ie. :input:visible
* can be bind with APEX items, jQuery selectors, regions

## Roadmap
* [ ] Caching help text on page load event

## Install

### Installation package
1. `src/dynamic_action_plugin_pretius_apex_alt_help_text.sql` - the plugin installation files for Oracle APEX 5.1 or higher


### Install procedure
To successfully install/update the plugin follow those steps:
1. Install the plugin file `dynamic_action_plugin_pretius_apex_alt_help_text.sql` using Oracle APEX plugin import wizard
1. Configure application level componenets of the plugin

## Usage guide
Available options for behaviour and appearance of the plugin are described in `Live demo` section and within `APEX inline help`.

Make sure APEX items have defined help text in `Help > Help text`.
1. Create APEX item and set Help text in section Help > Help text
1. Create new dynamic action
  * `Name` = `Your name for dynamic action`
  * `Event` = `Page load`
  * Go to `True actions`
1. Create new `True action`
1. Change Action to `Pretius APEX Help Text tooltip [plugin-in]`
1. Configure the plugin using attributes: Tooltip position, Align to, Align position, Button event, Item event(s), Hide others, Display title
1. Use affected elements to refer items:
  * set `Region` and select region containing item(s)
  * set `Item(s)` and provide APEX item names separated by coma
  * set `jQuery selector` and provide existing jQuery selector returning APEX items
1. Set `Fire On Page Load` to `Yes`
1. Save, run the page and test help text as tooltip.


## Changelog

### 1.0
Initial release

## About Author
Author            | Website                                 | Github                                       | Twitter                                       | E-mail
------------------|-----------------------------------------|----------------------------------------------|-----------------------------------------------|----------------------------------------------------
Bartosz Ostrowski | [http://ostrowskibartosz.pl](https://www.ostrowskibartosz.pl) | [@bostrowski](https://github.com/bostrowski) | [@bostrowsk1](https://twitter.com/bostrowsk1) | bostrowski@pretius.com, ostrowski.bartosz@gmail.com

## About Pretius
Pretius Sp. z o.o. Sp. K.

Address | Website | E-mail
--------|---------|-------
Przy Parku 2/2 Warsaw 02-384, Poland | [http://www.pretius.com](http://www.pretius.com) | [office@pretius.com](mailto:office@pretius.com)

## Free support
Pretius provides free support for the plugins at the GitHub platform. 
We monitor raised issues, prepare fixes, and answer your questions. However, please note that we deliver the plug-ins free of charge, and therefore we will not always be able to help you immediately. 

Interested in better support? 
* [Become a contributor!](#become-a-contributor) We always prioritize the issues raised by our contributors and fix them for free.
* [Consider comercial support.](#comercial-support) Options and benefits are described in the chapter below.


### Bug reporting and change requests
Have you found a bug or have an idea of additional features that the plugin could cover? Firstly, please check the Roadmap and Known issues sections. If your case is not on the lists, please open an issue on a GitHub page following these rules:
* issue should contain login credentials to the application at apex.oracle.com where the problem is reproduced;
* issue should include steps to reproduce the case in the demo application;
* issue should contain description about its nature.

### Implementation issues
If you encounter a problem during the plug-in implementation, please check out our demo application. We do our best to describe each possible use case precisely. If you can not find a solution or your problem is different, contact us: apex-plugins@pretius.com.

## Become a contributor!
We consider our plugins as genuine open source products, and we encourage you to become a contributor. Help us improve plugins by fixing bugs and developing extra features. Comment one of the opened issues or register a new one, to let others know what you are working on. When you finish, create a new pull request. We will review your code and add the changes to the repository.

By contributing to this repository, you help to build a strong APEX community. We will prioritize any issues raised by you in this and any other plugins.

## Comercial support
We are happy to share our experience for free, but we also realize that sometimes response time, quick implementation, SLA, and instant release for the latest version are crucial. That’s why if you need extended support for our plug-ins, please contact us at apex-plugins@pretius.com.
We offer:
* enterprise-level assistance;
* support in plug-ins implementation and utilization;
* dedicated contact channel to our developers;
* SLA at the level your organization require;
* priority update to next APEX releases and features listed in the roadmap.
