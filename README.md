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
- [Support](#support)
  - [Free support](#free-support)
  - [Paid support](#paid-support)

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

## Support
Our plugins are free to use but in some cases you might need to contact us. We are willing to assist you but in certain circumstances you will be charged for our time spent on helping you. Please keep in mind we do our best to keep documentation up to date and we won't answer question for which there is explaination in documentation (at github and as help text in application builder).

All request (bug fix / change request) should be posted in Issues Tab at github repository.

### Free support
We do support the plugin in certain cases such as bug fixing and change request. If you have faced issue that might be bug please check Issues tab in github repository. In case you won't be able to find related issue please raise the issue following these rules:

* issue should contain login credentials to application at apex.oracle.com where issue is reproduced
* issue should contain steps to reproduce the issue in demo application
* issue should contain description about it's nature

### Paid support
In case you are not able to implement the plugin or you are willing to have custom implementation based on the plugin attributes (ie. custom JavaScript callbacks) we are willing to help you. Please send inquiry to apex[at]pretius.com with description what you want us to help you with. We will contact you as soon as possible with pricing and possible dates.
