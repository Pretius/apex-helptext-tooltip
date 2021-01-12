set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.1.00.06'
,p_default_workspace_id=>10518555994626445
,p_default_application_id=>105
,p_default_owner=>'OSTROWB_SCHEMA'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/pretius_apex_alt_help_text
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(349810299976202281)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'PRETIUS_APEX_ALT_HELP_TEXT'
,p_display_name=>'Pretius APEX Help Text Tooltip'
,p_category=>'EFFECT'
,p_supported_ui_types=>'DESKTOP'
,p_javascript_file_urls=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#pretius.apexhelper.init.js',
'#PLUGIN_FILES#pretius.apexhelper.js'))
,p_css_file_urls=>'#PLUGIN_FILES#pretius.apexhelper.css'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'procedure drawLogs(',
'  p_dynamic_action in apex_plugin.t_dynamic_action,',
'  p_plugin         in apex_plugin.t_plugin ',
')',
'is',
'begin',
'  apex_javascript.add_onload_code(''',
'    console.log(''''--DRAW LOGS---------'''')',
'    console.log(''''--t_dynamic_action--'''')',
'    console.log(''''id="''||p_dynamic_action.id||''"'''');',
'    console.log(''''action="''||p_dynamic_action.action||''"'''');',
'    console.log(''''attribute_01="''||p_dynamic_action.attribute_01||''"'''');',
'    console.log(''''attribute_02="''||p_dynamic_action.attribute_02||''"'''');',
'    console.log(''''attribute_03="''||p_dynamic_action.attribute_03||''"'''');',
'    console.log(''''attribute_04="''||p_dynamic_action.attribute_04||''"'''');',
'    console.log(''''attribute_05="''||p_dynamic_action.attribute_05||''"'''');',
'    console.log(''''attribute_06="''||p_dynamic_action.attribute_06||''"'''');',
'    console.log(''''attribute_07="''||p_dynamic_action.attribute_07||''"'''');',
'    console.log(''''attribute_08="''||p_dynamic_action.attribute_08||''"'''');',
'    console.log(''''attribute_09="''||p_dynamic_action.attribute_09||''"'''');',
'    console.log(''''attribute_10="''||p_dynamic_action.attribute_10||''"'''');',
'    console.log(''''attribute_11="''||p_dynamic_action.attribute_11||''"'''');',
'    console.log(''''attribute_12="''||p_dynamic_action.attribute_12||''"'''');',
'    console.log(''''attribute_13="''||p_dynamic_action.attribute_13||''"'''');',
'    console.log(''''attribute_14="''||p_dynamic_action.attribute_14||''"'''');',
'    console.log(''''attribute_15="''||p_dynamic_action.attribute_15||''"'''');',
'    console.log(''''--t_plugin--'''')',
'    console.log(''''name="''||p_plugin.name||''"'''');',
'    console.log(''''file_prefix="''||p_plugin.file_prefix||''"'''');',
'    console.log(''''attribute_01="''||p_plugin.attribute_01||''"'''');',
'    console.log(''''attribute_02="''||p_plugin.attribute_02||''"'''');',
'    console.log(''''attribute_03="''||p_plugin.attribute_03||''"'''');',
'    console.log(''''attribute_04="''||p_plugin.attribute_04||''"'''');',
'    console.log(''''attribute_05="''||p_plugin.attribute_05||''"'''');',
'    console.log(''''attribute_06="''||p_plugin.attribute_06||''"'''');',
'    console.log(''''attribute_07="''||p_plugin.attribute_07||''"'''');',
'    console.log(''''attribute_08="''||p_plugin.attribute_08||''"'''');',
'    console.log(''''attribute_09="''||p_plugin.attribute_09||''"'''');',
'    console.log(''''attribute_10="''||p_plugin.attribute_10||''"'''');',
'    console.log(''''attribute_11="''||p_plugin.attribute_11||''"'''');',
'    console.log(''''attribute_12="''||p_plugin.attribute_12||''"'''');',
'    console.log(''''attribute_13="''||p_plugin.attribute_13||''"'''');',
'    console.log(''''attribute_14="''||p_plugin.attribute_14||''"'''');',
'    console.log(''''attribute_15="''||p_plugin.attribute_15||''"'''');',
'    console.log(''''--//DRAW LOGS---------'''')',
'  '');',
'end;',
'',
'--PRETIUS_COM_NOTIFICATION',
'function pretius_help_text (',
'  p_dynamic_action in apex_plugin.t_dynamic_action,',
'  p_plugin         in apex_plugin.t_plugin ',
') return apex_plugin.t_dynamic_action_render_result',
'is',
'  v_action  varchar2(50)  := p_dynamic_action.action;',
'  v_id      number        := p_dynamic_action.id;',
'  --uzelznij ta zmienna od atrybutu pluginu',
'  v_log2console boolean := true;',
'  v_result apex_plugin.t_dynamic_action_render_result;',
'',
'  attr_app_maxWidth  varchar2(4000) := p_plugin.attribute_01;',
'  attr_app_maxHeight varchar2(4000) := p_plugin.attribute_02;',
'',
'  attr_btn_event    varchar2(4000) := p_dynamic_action.attribute_01;',
'  attr_item_event   varchar2(4000) := p_dynamic_action.attribute_02;',
'  attr_align_to     varchar2(4000) := p_dynamic_action.attribute_03;',
'  attr_position     varchar2(4000) := p_dynamic_action.attribute_04;',
'  attr_item_pos     varchar2(4000) := p_dynamic_action.attribute_05;',
'  attr_hide_others  varchar2(4000) := p_dynamic_action.attribute_06;',
'  attr_show_title   varchar2(4000) := p_dynamic_action.attribute_07;',
'',
'  v_da_settings clob;',
'',
'BEGIN',
'  v_result.ajax_identifier := wwv_flow_plugin.get_ajax_identifier;',
'',
'  --drawLogs(p_dynamic_action, p_plugin);',
'  ',
'  -- obiekt dynamicznej akcji',
'  apex_json.initialize_clob_output;',
'  apex_json.open_object;',
'    apex_json.write( ''showTitle''        , attr_show_title );',
'    apex_json.write( ''maxWidth''         , attr_app_maxWidth );',
'    apex_json.write( ''maxHeight''        , attr_app_maxHeight );',
'    apex_json.write( ''ajaxId''           , v_result.ajax_identifier );',
'    apex_json.write( ''hideOther''        , attr_hide_others );',
'    apex_json.write( ''position''         , attr_position );',
'    apex_json.write( ''alignTo''          , attr_align_to );',
'    apex_json.write( ''alignToPosition''  , attr_item_pos );',
'',
'',
'    apex_json.open_object(''buttonEvent'');',
'      apex_json.write( ''click''      , case when instr( attr_btn_event, ''click''      ) > 0 then true else false end );',
'      apex_json.write( ''mouseover'' , case when instr( attr_btn_event, ''mouseover'' ) > 0 then true else false end );',
'    apex_json.close_object;',
'',
'    apex_json.open_object(''itemEvent'');',
'      apex_json.write( ''focus''      , case when instr( attr_item_event, ''focus''      ) > 0 then true else false end );',
'      apex_json.write( ''mouseover'' , case when instr( attr_item_event, ''mouseover'' ) > 0 then true else false end );',
'    apex_json.close_object;',
'    ',
'',
'  apex_json.close_object;',
'',
'  v_da_settings := apex_json.get_clob_output;',
'',
'  apex_json.free_output;',
'    ',
'  v_result.javascript_function := ''function() {',
'    pretius_apexhelper_init(this, ''||v_da_settings||'');',
'  }'';',
'',
'  return v_result;',
'',
'EXCEPTION',
'  WHEN OTHERS then',
'    APEX_JAVASCRIPT.add_onload_code(''',
'      console.log(''''While rendering plugin error ocured: ''||SQLERRM||'' '''');      ',
'    '');  ',
'    return v_result;',
'end pretius_help_text;',
'',
'function pretius_help_text_ajax (',
'  p_dynamic_action in apex_plugin.t_dynamic_action,',
'  p_plugin         in apex_plugin.t_plugin ',
') return apex_plugin.t_dynamic_action_ajax_result',
'is',
'  v_result_ajax apex_plugin.t_dynamic_action_ajax_result;',
'',
'  ajax_x01 varchar2(100) := apex_application.g_x01;',
'',
'  v_item_name varchar2(100);',
'  v_item_id   varchar2(100);',
'  v_item_help varchar2(4000);',
'',
'begin',
'  ',
'  ajax_x01 := replace(ajax_x01, ''_fieldset'', '''');',
'  ',
'  begin',
'    select ',
'      ITEM_NAME,',
'      ITEM_ID,',
'      ITEM_HELP_TEXT',
'    into',
'      v_item_name,',
'      v_item_id,',
'      v_item_help    ',
'    from ',
'      APEX_APPLICATION_PAGE_ITEMS ',
'    where ',
'      application_id = :APP_ID',
'      and page_id = :APP_PAGE_ID',
'      and ITEM_NAME = ajax_x01;',
'      /*and (',
'        ITEM_NAME = ajax_x01',
'        or ITEM_ID = ajax_x01',
'      );*/',
'  exception',
'    when others then',
'      apex_json.open_object;',
'        apex_json.write( ''ajaxSuccess'', false);',
'        apex_json.write( ''ajaxX01'', ajax_x01);',
'        apex_json.open_object(''error'');',
'          apex_json.write( ''msg'', SQLERRM);',
'          apex_json.write( ''desc'', ''Retrieving item help text'');',
'        apex_json.close_object;',
'      apex_json.close_object;',
'',
'      return v_result_ajax;      ',
'  end;',
'',
'  apex_json.open_object;',
'    apex_json.write( ''ajaxSuccess'', true);',
'    apex_json.write( ''ajaxX01'', ajax_x01);',
'    apex_json.open_object(''result'');',
'      apex_json.write( ''itemName'', v_item_name);',
'      apex_json.write( ''itemId'', v_item_id);',
'      apex_json.write( ''help'', v_item_help);',
'    apex_json.close_object;    ',
'',
'  apex_json.close_object;',
'',
'  ',
'  return v_result_ajax;',
'exception',
'  when others then',
'    apex_json.open_object;',
'      apex_json.write( ''ajaxSuccess'', false);',
'      apex_json.write( ''ajaxX01'', ajax_x01);',
'        apex_json.open_object(''error'');',
'          apex_json.write( ''msg'', SQLERRM);',
'          apex_json.write( ''desc'', ''Ajax process error'');',
'        apex_json.close_object;',
'    apex_json.close_object;',
'',
'    return v_result_ajax;',
'end pretius_help_text_ajax;'))
,p_render_function=>'pretius_help_text'
,p_ajax_function=>'pretius_help_text_ajax'
,p_standard_attributes=>'ITEM:REGION:JQUERY_SELECTOR:REQUIRED:ONLOAD'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<p>',
'The plugin overrides native APEX help text presentation layer (inline dialog) with tooltips in Oracle APEX 5 and Universal Theme. The tooltip can be aligned using 24 positions and it can be aligned to item, item label and item help button.',
'</p>',
'<p>',
'Author: <code>Bartosz Ostrowski</code><br/>',
'E-mail: <code>bostrowski@pretius.com</code>, <code>ostrowski.bartosz@gmail.com</code><br/>',
'Twitter: <code>@bostrowsk1</code><br/>',
'Plugin home page: <code>http://apex.pretius.com/apex/f?p=PLUGINS:HELPTEXT</code>',
'</p>'))
,p_version_identifier=>'1.0'
,p_about_url=>'http://apex.pretius.com/apex/f?p=PLUGINS:HELPTEXT'
,p_files_version=>40
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(350162376260518539)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Max width'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'720px'
,p_unit=>'px'
,p_is_translatable=>false
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul>',
'<li><code>720px</code> - maximum width defined in pixels</li>',
'<li><code>50%</code> - maximum width defined in percent width of the browser window</li>',
'</ul>'))
,p_help_text=>'This attribute defines maximum width of the tooltip. Maximum width can be provided as number of pixels with unit (px) or percent.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(350203264026589684)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Max height'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'500'
,p_unit=>'px'
,p_is_translatable=>false
,p_examples=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'<ul>',
'<li><code>720px</code> - maximum height defined in pixels</li>',
'<li><code>50%</code> - maximum height defined in percent width of the browser window</li>',
'</ul>'))
,p_help_text=>'This attribute defines maximum height of the tooltip. Maximum height can be provided as number of pixels with unit (px) or percent.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(349810739672248755)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Button event'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'click'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Picked option defines what event is bound to <code>APEX item button help</code>.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349811098805249673)
,p_plugin_attribute_id=>wwv_flow_api.id(349810739672248755)
,p_display_sequence=>10
,p_display_value=>'Click'
,p_return_value=>'click'
,p_is_quick_pick=>true
,p_help_text=>'When this option selected, <code>APEX item button help</code> is bound with <code>Click</code> event. Clicking on <code>APEX item help button</code> toggles tooltip.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349811817831251042)
,p_plugin_attribute_id=>wwv_flow_api.id(349810739672248755)
,p_display_sequence=>30
,p_display_value=>'Hover'
,p_return_value=>'mouseover'
,p_is_quick_pick=>true
,p_help_text=>'When this option selected, <code>APEX item button help</code> is bound with <code>Mouse over</code> and <code>Mouse leave</code> events. Tooltip is visible only when mouse is over item help button. When mouse leaves button, tooltip is no longer visib'
||'le.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(349813757214322694)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Item event(s)'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Checked options define whats event are bound to <code>APEX item input</code>.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349814089515323245)
,p_plugin_attribute_id=>wwv_flow_api.id(349813757214322694)
,p_display_sequence=>10
,p_display_value=>'Focus'
,p_return_value=>'focus'
,p_help_text=>'When this option checked, APEX item input is bound with <code>Focus</code> event. Tooltip is visible only when input is focused. When cursor leaves input, tooltip is no longer visible.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349814484807326320)
,p_plugin_attribute_id=>wwv_flow_api.id(349813757214322694)
,p_display_sequence=>20
,p_display_value=>'Hover'
,p_return_value=>'mouseover'
,p_help_text=>'When this option checked, APEX item input is bound with <code>Mouse over</code> and <code>Mouse leave</code> events. Tooltip is visible only when mouse is over input. When mouse leaves input, tooltip is no longer visible.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(349815398878334060)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>3
,p_prompt=>'Align to'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'INPUT'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Picked option defines what APEX item component is indicated by the tooltip.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349815655161336435)
,p_plugin_attribute_id=>wwv_flow_api.id(349815398878334060)
,p_display_sequence=>10
,p_display_value=>'Item'
,p_return_value=>'INPUT'
,p_is_quick_pick=>true
,p_help_text=>'When tooltip is shown, the tooltip arrow indicates <code>APEX item input</code>.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349860749715603181)
,p_plugin_attribute_id=>wwv_flow_api.id(349815398878334060)
,p_display_sequence=>30
,p_display_value=>'Item label'
,p_return_value=>'LABEL'
,p_is_quick_pick=>true
,p_help_text=>'When tooltip is shown, the tooltip arrow indicates <code>APEX item input label</code>.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349816079323337334)
,p_plugin_attribute_id=>wwv_flow_api.id(349815398878334060)
,p_display_sequence=>40
,p_display_value=>'Item help button'
,p_return_value=>'BUTTON'
,p_help_text=>'When tooltip is shown, the tooltip arrow indicates <code>APEX item help button</code>.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(349816421014341033)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>1
,p_prompt=>'Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'ABOVERIGHT'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Picked option defines position of the tooltip aligned to provided the APEX item component (item, label, help button).'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349817579768345343)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>1
,p_display_value=>'Above & float left'
,p_return_value=>'ABOVELEFT'
,p_is_quick_pick=>true
,p_help_text=>'Can be modified with <b>Align position</b> attribute.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349817935926347275)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>2
,p_display_value=>'Above & centered'
,p_return_value=>'ABOVECENTER'
,p_is_quick_pick=>true
,p_help_text=>'Can be modified with <b>Align position</b> attribute.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349818353847348363)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>4
,p_display_value=>'Above & float right'
,p_return_value=>'ABOVERIGHT'
,p_is_quick_pick=>true
,p_help_text=>'Can be modified with <b>Align position</b> attribute.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349818762082349385)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>60
,p_display_value=>'Below & float left'
,p_return_value=>'BOTTOMLEFT'
,p_is_quick_pick=>true
,p_help_text=>'Can be modified with <b>Align position</b> attribute.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349819134143350398)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>61
,p_display_value=>'Below & centered'
,p_return_value=>'BOTTOMCENTER'
,p_is_quick_pick=>true
,p_help_text=>'Can be modified with <b>Align position</b> attribute.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349819536849351561)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>62
,p_display_value=>'Below & float right'
,p_return_value=>'BOTTOMRIGHT'
,p_is_quick_pick=>true
,p_help_text=>'Can be modified with <b>Align position</b> attribute.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349933331947117857)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>85
,p_display_value=>'Right & drop down'
,p_return_value=>'RIGHTTOP'
,p_is_quick_pick=>true
,p_help_text=>'This option is not affected by attribute <b>Align position</b>.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349816747245341884)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>86
,p_display_value=>'Right & centered'
,p_return_value=>'RIGHT'
,p_is_quick_pick=>true
,p_help_text=>'This option is not affected by attribute <b>Align position</b>.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349933770697119280)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>87
,p_display_value=>'Right & float up'
,p_return_value=>'RIGHTBOTTOM'
,p_is_quick_pick=>true
,p_help_text=>'This option is not affected by attribute <b>Align position</b>.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(350005339147278381)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>110
,p_display_value=>'Left & drop down'
,p_return_value=>'LEFTTOP'
,p_is_quick_pick=>true
,p_help_text=>'This option is not affected by attribute <b>Align position</b>.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349817119561342816)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>115
,p_display_value=>'Left & centered'
,p_return_value=>'LEFT'
,p_is_quick_pick=>true
,p_help_text=>'This option is not affected by attribute <b>Align position</b>.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(350005718694280760)
,p_plugin_attribute_id=>wwv_flow_api.id(349816421014341033)
,p_display_sequence=>120
,p_display_value=>'Left & float up'
,p_return_value=>'LEFTBOTTOM'
,p_is_quick_pick=>true
,p_help_text=>'This option is not affected by attribute <b>Align position</b>.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(349841354022005518)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>5
,p_prompt=>'Align position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'START'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(349815398878334060)
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'INPUT,LABEL'
,p_lov_type=>'STATIC'
,p_help_text=>'Picked option defines tooltip arrow position aligned to APEX item component (input or label)'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349841668988006175)
,p_plugin_attribute_id=>wwv_flow_api.id(349841354022005518)
,p_display_sequence=>10
,p_display_value=>'Start'
,p_return_value=>'START'
,p_is_quick_pick=>true
,p_help_text=>'When this option is selected, the tooltip arrow indicates the beginning of the APEX item component.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349842047929007156)
,p_plugin_attribute_id=>wwv_flow_api.id(349841354022005518)
,p_display_sequence=>20
,p_display_value=>'Center'
,p_return_value=>'MIDDLE'
,p_is_quick_pick=>true
,p_help_text=>'When this option is selected, the tooltip arrow indicates the center of the APEX item component.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349842452252007706)
,p_plugin_attribute_id=>wwv_flow_api.id(349841354022005518)
,p_display_sequence=>30
,p_display_value=>'End'
,p_return_value=>'END'
,p_is_quick_pick=>true
,p_help_text=>'When this option is selected, the tooltip arrow indicates the ending of the APEX item component.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(349854281412373158)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Hide others'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'NONE'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Picked option defines what happens when current tooltip is shown.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349854991536373978)
,p_plugin_attribute_id=>wwv_flow_api.id(349854281412373158)
,p_display_sequence=>10
,p_display_value=>'None'
,p_return_value=>'NONE'
,p_is_quick_pick=>true
,p_help_text=>'None tooltip is hidden when current help text tooltip is displayed.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349855316137375533)
,p_plugin_attribute_id=>wwv_flow_api.id(349854281412373158)
,p_display_sequence=>20
,p_display_value=>'This dynamic action'
,p_return_value=>'DA'
,p_is_quick_pick=>true
,p_help_text=>'All tooltips (defined within same dynamic action) but current are hidden.'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(349855793807376901)
,p_plugin_attribute_id=>wwv_flow_api.id(349854281412373158)
,p_display_sequence=>30
,p_display_value=>'All plugin instances on page'
,p_return_value=>'ALL'
,p_is_quick_pick=>true
,p_help_text=>'Regardless the number of dynamic actions all but current <code>help text tooltip</code> are hidden.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(350218802550003657)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Display title'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
,p_help_text=>'<p>This attribute defines whether title (<code>APEX item label text</code>) is shown or not.</p>'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '242E7769646765742827707265746975732E6170657868656C706572272C207B0D0A20206572726F72733A207B0D0A20202020696E76616C69644576656E743A20274E696520777370696572616E79206576656E74270D0A20207D2C0D0A202061706578';
wwv_flow_api.g_varchar2_table(2) := '496E746567726174696F6E3A207B0D0A202020202F2F6B6C6173612070727A796369736B75206F64706F77696164616A616365676F207A6120706F64706F776965647A690D0A202020202F2F7A616B6C6164616D207A652062746E206A657374207A6177';
wwv_flow_api.g_varchar2_table(3) := '737A65206F626F6B206974656D2077696563206D6F7A656D7920737A756B616320706F20706172656E740D0A20202020627574746F6E436C6173733A20272E742D427574746F6E2E742D427574746F6E2D2D68656C70427574746F6E2E6A732D6974656D';
wwv_flow_api.g_varchar2_table(4) := '48656C7027200D0A20207D2C0D0A20206973416A617852756E6E696E673A2066616C73652C0D0A202068656C705465787448746D6C3A206E756C6C2C0D0A202068656C7065723A20756E646566696E65642C0D0A202068656C70427574746F6E3A20756E';
wwv_flow_api.g_varchar2_table(5) := '646566696E65642C0D0A2020627574746F6E49636F6E3A206E756C6C2C0D0A202073687574746C65427574746F6E733A2024286E756C6C292C0D0A20206669656C647365743A2066616C73652C0D0A20206461496E707574733A206E756C6C2C0D0A2020';
wwv_flow_api.g_varchar2_table(6) := '696E707574733A20756E646566696E65642C0D0A20206669656C647365744D6F7573654F7665723A2066616C73652C0D0A2020697348656C70657253686F776E3A2066616C73652C0D0A2020686964654F746865723A206E756C6C2C202F2F204E4F4E45';
wwv_flow_api.g_varchar2_table(7) := '2C2044412C20414C4C0D0A20206F7074696F6E733A207B0D0A0D0A20207D2C0D0A20205F6372656174653A2066756E6374696F6E28297B0D0A2020202076617220696E707574733B0D0A0D0A20202020746869732E5F73757065722820746869732E6F70';
wwv_flow_api.g_varchar2_table(8) := '74696F6E7320293B0D0A0D0A20202020746869732E656C656D656E742E616464436C6173732827707265746975732D2D6170657868656C70657227293B0D0A0D0A20202020746869732E68656C70427574746F6E203D20746869732E656C656D656E742E';
wwv_flow_api.g_varchar2_table(9) := '6E657874416C6C2820746869732E61706578496E746567726174696F6E2E627574746F6E436C61737320292E666972737428293B0D0A20202020746869732E627574746F6E49636F6E203D20746869732E68656C70427574746F6E2E66696E6428277370';
wwv_flow_api.g_varchar2_table(10) := '616E27292E617474722827636C61737327293B0D0A0D0A0D0A202020202F2F7A61626C6F6B756A20636C69636B206E6120627574746F6E0D0A20202020746869732E68656C70427574746F6E2E636C69636B2866756E6374696F6E2865297B200D0A2020';
wwv_flow_api.g_varchar2_table(11) := '20202020652E70726576656E7444656661756C7428293B0D0A202020202020652E73746F70496D6D65646961746550726F7061676174696F6E28293B0D0A202020202020242874686973292E747269676765722827636C69636B2E6170657868656C7065';
wwv_flow_api.g_varchar2_table(12) := '7227293B0D0A202020207D293B0D0A2020202020200D0A202020206966202820746869732E6F7074696F6E732E627574746F6E4576656E742E636C69636B2029207B0D0A202020202020746869732E68656C70427574746F6E2E6F6E2827636C69636B2E';
wwv_flow_api.g_varchar2_table(13) := '6170657868656C706572272C20242E70726F78792820746869732E5F627574746F6E436C69636B2C2074686973202920293B0D0A202020207D0D0A20202020656C7365207B0D0A202020202020746869732E68656C70427574746F6E2E6F6E2827636C69';
wwv_flow_api.g_varchar2_table(14) := '636B2E6170657868656C706572272C2066756E6374696F6E2865297B202428652E746172676574292E626C757228293B207D20293B200D0A202020207D0D0A202020200D0A202020206966202820746869732E6F7074696F6E732E627574746F6E457665';
wwv_flow_api.g_varchar2_table(15) := '6E742E6D6F7573656F7665722029207B0D0A202020202020746869732E68656C70427574746F6E0D0A20202020202020202E6F6E28276D6F7573656F76657227202C20242E70726F78792820746869732E5F627574746F6E4D6F7573654F766572202C20';
wwv_flow_api.g_varchar2_table(16) := '74686973202920290D0A20202020202020202E6F6E28276D6F7573656C65617665272C20242E70726F78792820746869732E5F627574746F6E4D6F7573654C656176652C2074686973202920293B0D0A202020207D0D0A0D0A0D0A0D0A20202020696620';
wwv_flow_api.g_varchar2_table(17) := '2820746869732E656C656D656E742E697328276669656C6473657427292029207B0D0A2020202020202F2F6669656C647365740D0A202020202020746869732E6669656C64736574203D20747275653B0D0A0D0A2020202020206966202820746869732E';
wwv_flow_api.g_varchar2_table(18) := '656C656D656E742E697328272E73687574746C6527292029207B0D0A2020202020202020746869732E73687574746C65427574746F6E73203D20746869732E656C656D656E742E66696E6428272E612D427574746F6E2D2D73687574746C6527293B0D0A';
wwv_flow_api.g_varchar2_table(19) := '2020202020207D0D0A0D0A202020202020696E70757473203D20746869732E656C656D656E740D0A20202020202020202E66696E6428273A696E7075742C6C6162656C27290D0A20202020202020202E6E6F742827627574746F6E27290D0A2020202020';
wwv_flow_api.g_varchar2_table(20) := '2020202E6E6F742820746869732E61706578496E746567726174696F6E2E627574746F6E436C61737320290D0A20202020202020202E6164642820746869732E73687574746C65427574746F6E7320293B0D0A2020202020202F2F646F6461C487206C61';
wwv_flow_api.g_varchar2_table(21) := '62656C650D0A202020207D0D0A20202020656C7365207B0D0A2020202020202F2F7A77796B6C6520706F6C650D0A202020202020696E70757473203D20746869732E656C656D656E743B0D0A202020207D0D0A0D0A202020202F2F62696E64206669656C';
wwv_flow_api.g_varchar2_table(22) := '6473657420616E64207374616E64616C6F6E6520696E7075740D0A20202020746869732E656C656D656E742E6F6E282773686F774170657848656C706572272C20242E70726F78792820746869732E73686F772C20746869732029293B0D0A2020202074';
wwv_flow_api.g_varchar2_table(23) := '6869732E656C656D656E742E6F6E2827686964654170657848656C706572272C20242E70726F78792820746869732E686964652C20746869732029293B0D0A0D0A202020206966202820746869732E6F7074696F6E732E6974656D4576656E742E6D6F75';
wwv_flow_api.g_varchar2_table(24) := '73656F7665722029207B0D0A202020202020746869732E656C656D656E740D0A20202020202020202E6F6E28276D6F7573656F76657227202C20242E70726F78792820746869732E5F6669656C645365744D6F7573654F766572202C2074686973202929';
wwv_flow_api.g_varchar2_table(25) := '0D0A20202020202020202E6F6E28276D6F7573656C65617665272C20242E70726F78792820746869732E5F6669656C645365744D6F7573654C656176652C20746869732029293B0D0A0D0A202020202020696E707574732E6F6E28276D6F7573656F7665';
wwv_flow_api.g_varchar2_table(26) := '72272C20242E70726F78792820746869732E5F64656C65676174654D6F7573654F7665722C20746869732029293B0D0A202020202020696E707574732E6F6E28276D6F7573656C65617665272C20242E70726F78792820746869732E5F64656C65676174';
wwv_flow_api.g_varchar2_table(27) := '654D6F7573654C656176652C20746869732029293B0D0A202020207D0D0A0D0A202020206966202820746869732E6F7074696F6E732E6974656D4576656E742E666F6375732029207B0D0A202020202020696E707574732E6F6E2827666F63757327202C';
wwv_flow_api.g_varchar2_table(28) := '20242E70726F78792820746869732E5F64656C65676174654974656D466F63757320202C20746869732029293B0D0A202020202020696E707574732E6F6E2827626C75722720202C20242E70726F78792820746869732E5F64656C65676174654974656D';
wwv_flow_api.g_varchar2_table(29) := '426C75722020202C20746869732029293B0D0A202020207D0D0A0D0A20202020746869732E696E70757473203D20696E707574733B0D0A20202020746869732E6C6162656C203D20746869732E5F66696E644C6162656C28293B0D0A2020202074686973';
wwv_flow_api.g_varchar2_table(30) := '2E68656C706572203D20746869732E5F63726561746548656C70657228293B0D0A20202020746869732E68656C7065722E66696E6428272E707265746975732D2D746F6F6C7469702D636C6F736527292E6F6E2827636C69636B272C20242E70726F7879';
wwv_flow_api.g_varchar2_table(31) := '2820746869732E686964652C2074686973202920293B0D0A0D0A0D0A20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(32) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A0D0A20205F66696E644C6162656C3A2066756E6374696F6E28297B0D0A20202020766172206964203D206E756C6C3B0D0A0D0A';
wwv_flow_api.g_varchar2_table(33) := '202020206966202820746869732E6669656C6473657420262620746869732E656C656D656E742E697328272E73687574746C6527292029207B0D0A2020202020206964203D20746869732E656C656D656E742E70726F702827696427293B0D0A20202020';
wwv_flow_api.g_varchar2_table(34) := '7D0D0A20202020656C7365206966202820746869732E6669656C6473657420262620746869732E656C656D656E742E697328272E746578746172656127292029207B0D0A2020202020206964203D20746869732E656C656D656E742E66696E6428277465';
wwv_flow_api.g_varchar2_table(35) := '78746172656127292E70726F702827696427293B0D0A202020207D200D0A20202020656C7365206966202820746869732E6669656C6473657420262620746869732E656C656D656E742E697328272E726164696F5F67726F757027292029207B0D0A2020';
wwv_flow_api.g_varchar2_table(36) := '202020206964203D20746869732E656C656D656E742E70726F702827696427293B0D0A202020207D200D0A20202020656C7365206966202820746869732E6669656C6473657420262620746869732E656C656D656E742E697328272E636865636B626F78';
wwv_flow_api.g_varchar2_table(37) := '5F67726F757027292029207B0D0A2020202020206964203D20746869732E656C656D656E742E70726F702827696427293B0D0A202020207D0D0A20202020656C7365206966202820746869732E6669656C6473657420262620746869732E656C656D656E';
wwv_flow_api.g_varchar2_table(38) := '742E697328272E6C6F7627292029207B0D0A2020202020206964203D20746869732E656C656D656E742E66696E6428273A696E7075743A64697361626C656427292E70726F702827696427293B0D0A202020207D0D0A20202020656C7365206966202820';
wwv_flow_api.g_varchar2_table(39) := '0D0A202020202020746869732E656C656D656E742E6973282773656C6563742729200D0A2020202020207C7C20746869732E656C656D656E742E697328275B747970653D746578745D27290D0A2020202029207B0D0A2020202020206964203D20746869';
wwv_flow_api.g_varchar2_table(40) := '732E656C656D656E742E70726F702827696427293B200D0A202020207D0D0A20202020656C7365207B0D0A202020202020746869732E7468726F774572726F72282743616E742066696E64206C6162656C20666F7220656C656D656E742E27293B0D0A20';
wwv_flow_api.g_varchar2_table(41) := '2020207D0D0A0D0A2020202072657475726E202428275B666F723D272B69642B275D27293B0D0A20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(42) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A0D0A20205F64657374726F793A2066756E6374696F6E28297B0D0A202020202F2F636F6E736F6C65';
wwv_flow_api.g_varchar2_table(43) := '2E6C6F672820275F64657374726F792720293B0D0A20202020746869732E696E707574732E6F66662827666F63757320626C7572206D6F7573656C65617665206D6F7573656F76657227293B0D0A20202020746869732E656C656D656E742E6F66662827';
wwv_flow_api.g_varchar2_table(44) := '73686F774170657848656C70657220686964654170657848656C706572206D6F7573656F766572206D6F7573656C6561766527293B0D0A20202020746869732E68656C7065722E72656D6F766528293B0D0A0D0A20207D2C0D0A0D0A20202F2F0D0A2020';
wwv_flow_api.g_varchar2_table(45) := '2F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D';
wwv_flow_api.g_varchar2_table(46) := '0A20202F2F0D0A20205F626C6F636B4E6174697665427574746F6E436C69636B3A2066756E6374696F6E28206520297B0D0A20202020652E73746F70496D6D65646961746550726F7061676174696F6E28293B0D0A20207D2C0D0A20202F2F0D0A20202F';
wwv_flow_api.g_varchar2_table(47) := '2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A';
wwv_flow_api.g_varchar2_table(48) := '20202F2F0D0A20205F627574746F6E436C69636B3A2066756E6374696F6E28297B0D0A202020202F2F636F6E736F6C652E6C6F6728275F627574746F6E436C69636B27293B0D0A202020206966202820746869732E697348656C70657253686F776E2029';
wwv_flow_api.g_varchar2_table(49) := '207B0D0A202020202020746869732E6869646528293B20200D0A202020207D0D0A20202020656C7365207B0D0A202020202020746869732E73686F7728293B20200D0A202020207D0D0A202020200D0A20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D';
wwv_flow_api.g_varchar2_table(50) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D';
wwv_flow_api.g_varchar2_table(51) := '0A0D0A20205F627574746F6E4D6F7573654F7665723A2066756E6374696F6E28297B0D0A202020202F2F636F6E736F6C652E6C6F6728275F627574746F6E4D6F7573654F76657227293B0D0A20202020746869732E73686F7728293B0D0A20207D2C0D0A';
wwv_flow_api.g_varchar2_table(52) := '20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(53) := '2D2D2D2D2D2D2D0D0A20202F2F0D0A0D0A20205F627574746F6E4D6F7573654C656176653A2066756E6374696F6E28297B0D0A202020202F2F636F6E736F6C652E6C6F6728275F627574746F6E4D6F7573654C6561766527293B0D0A0D0A0D0A20202020';
wwv_flow_api.g_varchar2_table(54) := '746869732E6869646528293B0D0A20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(55) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A0D0A20205F63726561746548656C7065723A2066756E6374696F6E28297B0D0A0D0A20202020766172200D0A2020202020206469762C0D0A2020202020206D6178';
wwv_flow_api.g_varchar2_table(56) := '5769647468203D20746869732E6F7074696F6E732E6D617857696474682C0D0A2020202020206D6178486569676874203D20746869732E6F7074696F6E732E6D61784865696768742C0D0A2020202020206C6162656C203D20746869732E6C6162656C2E';
wwv_flow_api.g_varchar2_table(57) := '68746D6C28293B3B0D0A0D0A20202020646976203D20242827270D0A2020202020202B273C64697620636C6173733D22707265746975732D2D746F6F6C746970223E27202F2F6F70656E732D2D626F74746F6D2063656E7465720D0A2020202020202B27';
wwv_flow_api.g_varchar2_table(58) := '3C64697620636C6173733D22707265746975732D2D746F6F6C7469702D636C6F7365223E3C7370616E20636C6173733D2266612066612D74696D65732D636972636C652D6F223E3C2F7370616E3E3C2F6469763E270D0A2020202020202B273C64697620';
wwv_flow_api.g_varchar2_table(59) := '636C6173733D22707265746975732D2D746F6F6C7469702D7469746C65223E3C7370616E3E272B6C6162656C2B273C2F6469763E270D0A2020202020202B273C64697620636C6173733D22636F6E74656E7422207374796C653D226D61782D7769647468';
wwv_flow_api.g_varchar2_table(60) := '3A20272B6D617857696474682B273B6D61782D6865696768743A20272B6D61784865696768742B27223E3C2F6469763E270D0A2020202020202B273C2F6469763E270D0A202020202B2727293B0D0A0D0A202020206966202820746869732E6F7074696F';
wwv_flow_api.g_varchar2_table(61) := '6E732E73686F775469746C65203D3D202759272029207B0D0A2020202020206469762E616464436C617373282773686F775469746C6527290D0A202020207D0D0A0D0A202020206966202820746869732E6F7074696F6E732E706F736974696F6E203D3D';
wwv_flow_api.g_varchar2_table(62) := '20275249474854272029207B0D0A2020202020206469762E616464436C61737328276F70656E732D2D72696768742063656E74657227290D0A202020207D0D0A20202020656C7365206966202820746869732E6F7074696F6E732E706F736974696F6E20';
wwv_flow_api.g_varchar2_table(63) := '3D3D20275249474854544F50272029207B0D0A2020202020206469762E616464436C61737328276F70656E732D2D7269676874206172726F772D746F7027290D0A202020207D0D0A20202020656C7365206966202820746869732E6F7074696F6E732E70';
wwv_flow_api.g_varchar2_table(64) := '6F736974696F6E203D3D20275249474854424F54544F4D272029207B0D0A2020202020206469762E616464436C61737328276F70656E732D2D7269676874206172726F772D626F74746F6D27290D0A202020207D0D0A20202020656C7365206966202820';
wwv_flow_api.g_varchar2_table(65) := '746869732E6F7074696F6E732E706F736974696F6E203D3D20274C454654272029207B0D0A2020202020206469762E616464436C61737328276F70656E732D2D6C6566742063656E74657227290D0A202020207D0D0A20202020656C7365206966202820';
wwv_flow_api.g_varchar2_table(66) := '746869732E6F7074696F6E732E706F736974696F6E203D3D20274C454654544F50272029207B0D0A2020202020206469762E616464436C61737328276F70656E732D2D6C656674206172726F772D746F7027290D0A202020207D0D0A20202020656C7365';
wwv_flow_api.g_varchar2_table(67) := '206966202820746869732E6F7074696F6E732E706F736974696F6E203D3D20274C454654424F54544F4D272029207B0D0A2020202020206469762E616464436C61737328276F70656E732D2D6C656674206172726F772D626F74746F6D27290D0A202020';
wwv_flow_api.g_varchar2_table(68) := '207D0D0A0D0A202020200D0A202020200D0A20202020656C7365206966202820746869732E6F7074696F6E732E706F736974696F6E203D3D202741424F56454C454654272029207B0D0A2020202020206469762E616464436C61737328276F70656E732D';
wwv_flow_api.g_varchar2_table(69) := '2D746F70206C65667427290D0A202020207D0D0A20202020656C7365206966202820746869732E6F7074696F6E732E706F736974696F6E203D3D202741424F564543454E544552272029207B0D0A2020202020206469762E616464436C61737328276F70';
wwv_flow_api.g_varchar2_table(70) := '656E732D2D746F702063656E74657227290D0A202020207D0D0A20202020656C7365206966202820746869732E6F7074696F6E732E706F736974696F6E203D3D202741424F56455249474854272029207B0D0A2020202020206469762E616464436C6173';
wwv_flow_api.g_varchar2_table(71) := '7328276F70656E732D2D746F7020726967687427290D0A202020207D0D0A20202020656C7365206966202820746869732E6F7074696F6E732E706F736974696F6E203D3D2027424F54544F4D4C454654272029207B0D0A2020202020206469762E616464';
wwv_flow_api.g_varchar2_table(72) := '436C61737328276F70656E732D2D626F74746F6D206C65667427290D0A202020207D0D0A20202020656C7365206966202820746869732E6F7074696F6E732E706F736974696F6E203D3D2027424F54544F4D43454E544552272029207B0D0A2020202020';
wwv_flow_api.g_varchar2_table(73) := '206469762E616464436C61737328276F70656E732D2D626F74746F6D2063656E74657227290D0A202020207D0D0A20202020656C7365206966202820746869732E6F7074696F6E732E706F736974696F6E203D3D2027424F54544F4D5249474854272029';
wwv_flow_api.g_varchar2_table(74) := '207B0D0A2020202020206469762E616464436C61737328276F70656E732D2D626F74746F6D20726967687427290D0A202020207D0D0A20202020656C7365207B0D0A202020202020746869732E7468726F774572726F722827496E76616C696420706F73';
wwv_flow_api.g_varchar2_table(75) := '6974696F6E3A20272B746869732E6F7074696F6E732E706F736974696F6E293B0D0A202020207D0D0A202020200D0A20202020646976203D206469762E617070656E64546F2827626F647927293B0D0A0D0A0D0A0D0A2020202072657475726E20646976';
wwv_flow_api.g_varchar2_table(76) := '3B0D0A20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(77) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A20205F7365744F7074696F6E3A2066756E6374696F6E28206B65792C2076616C75652029207B0D0A2020202069662028206B6579203D3D3D202276616C7565222029207B0D0A202020202020';
wwv_flow_api.g_varchar2_table(78) := '76616C7565203D20746869732E5F636F6E73747261696E282076616C756520293B0D0A202020207D0D0A0D0A20202020746869732E5F737570657228206B65792C2076616C756520293B0D0A0D0A20207D2C20200D0A20202F2F0D0A20202F2F2D2D2D2D';
wwv_flow_api.g_varchar2_table(79) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D';
wwv_flow_api.g_varchar2_table(80) := '0A20205F7365744F7074696F6E733A2066756E6374696F6E28206F7074696F6E732029207B0D0A20202020746869732E5F737570657228206F7074696F6E7320293B0D0A20207D2C20200D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(81) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A20205F64656C656761';
wwv_flow_api.g_varchar2_table(82) := '74654974656D466F6375733A2066756E6374696F6E28297B0D0A202020202F2F636F6E736F6C652E6C6F6728275F64656C65676174654974656D466F63757327293B0D0A20202020746869732E73686F7728293B0D0A20207D2C0D0A20202F2F0D0A2020';
wwv_flow_api.g_varchar2_table(83) := '2F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D';
wwv_flow_api.g_varchar2_table(84) := '0A20202F2F0D0A20205F64656C65676174654974656D426C75723A2066756E6374696F6E28206520297B0D0A202020202F2F636F6E736F6C652E6C6F6728275F64656C65676174654974656D426C757227293B0D0A0D0A2020202073657454696D656F75';
wwv_flow_api.g_varchar2_table(85) := '7428242E70726F78792866756E6374696F6E28297B0D0A2020202020206966202820746869732E656C656D656E742E66696E6428273A696E7075743A666F63757327292E6E6F7428273A627574746F6E27292E6164642820746869732E73687574746C65';
wwv_flow_api.g_varchar2_table(86) := '427574746F6E732E66696C7465722866756E6374696F6E28297B72657475726E20242874686973292E697328273A666F63757327297D2920292E73697A652829203D3D20302029207B0D0A2020202020202020746869732E6869646528293B0D0A202020';
wwv_flow_api.g_varchar2_table(87) := '2020207D0D0A202020207D2C2074686973292C20313030293B0D0A20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(88) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A0D0A20205F6669656C645365744D6F7573654F7665723A2066756E6374696F6E28297B0D0A202020202F2F636F6E736F6C652E6C';
wwv_flow_api.g_varchar2_table(89) := '6F6728275F6669656C645365744D6F7573654F76657227293B0D0A20202020746869732E6669656C647365744D6F7573654F766572203D20747275653B0D0A20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(90) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A0D0A20205F6669656C645365744D6F75';
wwv_flow_api.g_varchar2_table(91) := '73654C656176653A2066756E6374696F6E28297B0D0A202020202F2F636F6E736F6C652E6C6F6728275F6669656C645365744D6F7573654C6561766527293B0D0A20202020746869732E6669656C647365744D6F7573654F766572203D2066616C73653B';
wwv_flow_api.g_varchar2_table(92) := '0D0A0D0A202020206966202820746869732E656C656D656E742E66696E6428273A666F63757327292E73697A652829203E203020262620746869732E6F7074696F6E732E6974656D4576656E742E666F6375732029207B0D0A2020202020202F2F6A65C5';
wwv_flow_api.g_varchar2_table(93) := '9B6C69206A6573742073666F6375736F77616E79206A616B697320656C656D656E74206920666F637573206A657374206F62736C75676977616E792C20746F206E69652063686F77616A2068656C706572610D0A20202020202072657475726E3B0D0A20';
wwv_flow_api.g_varchar2_table(94) := '2020207D0D0A20202020656C7365207B0D0A202020202020746869732E6869646528293B20200D0A202020207D0D0A0D0A202020200D0A20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(95) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A0D0A20205F64656C65676174654D6F7573654C656176653A';
wwv_flow_api.g_varchar2_table(96) := '2066756E6374696F6E28297B0D0A20202020746869732E656C656D656E742E747269676765722827686964654170657848656C70657227293B0D0A0D0A0D0A20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(97) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A0D0A20205F64656C65676174654D6F75';
wwv_flow_api.g_varchar2_table(98) := '73654F7665723A2066756E6374696F6E28297B0D0A20202020746869732E656C656D656E742E74726967676572282773686F774170657848656C70657227293B0D0A20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(99) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A0D0A2020686964653A2066756E';
wwv_flow_api.g_varchar2_table(100) := '6374696F6E28297B0D0A202020202F2F636F6E736F6C652E6C6F6728276869646527293B0D0A202020206966202820746869732E697348656C70657253686F776E2029207B0D0A2020202020206966202820746869732E6669656C647365742026262074';
wwv_flow_api.g_varchar2_table(101) := '6869732E6669656C647365744D6F7573654F7665722029207B0D0A20202020202020202F2F646F6E7420686964652C206669656C6473657420686173206D6F757365206F7665720D0A20202020202020206E756C6C3B0D0A2020202020207D0D0A202020';
wwv_flow_api.g_varchar2_table(102) := '202020656C7365207B0D0A2020202020202020746869732E68656C7065722E666164654F75742835302C20242E70726F7879282066756E6374696F6E28297B0D0A20202020202020202020746869732E68656C7065722E72656D6F7665436C6173732827';
wwv_flow_api.g_varchar2_table(103) := '76697369626C6527293B0D0A20202020202020202020746869732E656C656D656E742E72656D6F7665436C617373282027707265746975732D2D686967686C696768742720293B0D0A20202020202020207D2C207468697329293B0D0A20202020202020';
wwv_flow_api.g_varchar2_table(104) := '200D0A2020202020202020746869732E697348656C70657253686F776E203D2066616C73653B0D0A2020202020202020746869732E5F627574746F6E4368616E676549636F6E2827696E697469616C27293B0D0A2020202020207D0D0A202020207D0D0A';
wwv_flow_api.g_varchar2_table(105) := '20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(106) := '2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A20205F736574506F736974696F6E3A2066756E6374696F6E28297B0D0A20202020766172200D0A202020202020616C69676E546F456C656D656E742C0D0A202020202020656C656D656E7448656967';
wwv_flow_api.g_varchar2_table(107) := '68742C20656C656D656E744F66667365742C20656C656D656E744F7574657257696474682C20656C656D656E744F757465724865696768742C0D0A20202020202077696E646F775769647468203D20242877696E646F77292E776964746828292C202020';
wwv_flow_api.g_varchar2_table(108) := '2020200D0A2020202020202F2F726F7A6D696172206172726F772C206E616C657A7920706F6D6E6F7A79632072617A79206477610D0A2020202020206172726F775769647468203D20372C0D0A2020202020202F2F6F646C65676C6F7363206F64206B72';
wwv_flow_api.g_varchar2_table(109) := '617765647A690D0A2020202020206172726F7750616464696E6746726F6D426F72646572203D20352C0D0A20202020202068656C7065724865696768742C2068656C70657257696474682C0D0A20202020202073687574746C65456C656D4D617267696E';
wwv_flow_api.g_varchar2_table(110) := '546F70203D20302C0D0A20202020202073687574746C65456C656D4D617267696E426F74746F6D203D20302C0D0A202020202020746F702C206C6566742C2072696768742C206F66667365742C0D0A2020202020206F72674C656674203D207061727365';
wwv_flow_api.g_varchar2_table(111) := '496E7428746869732E68656C7065722E63737328276C656674272920293B0D0A0D0A202020206966202820746869732E6F7074696F6E732E616C69676E546F203D3D2027494E505554272029207B0D0A202020202020616C69676E546F456C656D656E74';
wwv_flow_api.g_varchar2_table(112) := '203D20746869732E656C656D656E743B0D0A202020207D0D0A20202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F203D3D2027425554544F4E272029207B0D0A202020202020616C69676E546F456C656D656E74203D20';
wwv_flow_api.g_varchar2_table(113) := '746869732E68656C70427574746F6E3B0D0A202020207D0D0A20202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F203D3D20274C4142454C272029207B0D0A202020202020616C69676E546F456C656D656E74203D2074';
wwv_flow_api.g_varchar2_table(114) := '6869732E6C6162656C3B200D0A202020207D0D0A20202020656C7365207B0D0A202020202020746869732E7468726F774572726F722827496E76616C696420616C69676E546F3A20272B746869732E6F7074696F6E732E616C69676E546F506F73697469';
wwv_flow_api.g_varchar2_table(115) := '6F6E293B0D0A202020207D0D0A0D0A20202020656C656D656E74486569676874203D20616C69676E546F456C656D656E742E6F7574657248656967687428292C0D0A20202020656C656D656E744F6666736574203D20616C69676E546F456C656D656E74';
wwv_flow_api.g_varchar2_table(116) := '2E6F666673657428292C0D0A20202020656C656D656E744F757465725769647468203D20616C69676E546F456C656D656E742E6F75746572576964746828292C0D0A20202020656C656D656E744F75746572486569676874203D20616C69676E546F456C';
wwv_flow_api.g_varchar2_table(117) := '656D656E742E6F7574657248656967687428293B0D0A0D0A202020206966202820746869732E6669656C6473657420262620746869732E656C656D656E742E697328272E73687574746C6527292029207B0D0A20202020202073687574746C65456C656D';
wwv_flow_api.g_varchar2_table(118) := '4D617267696E546F70203D207061727365496E742820746869732E656C656D656E742E66696E64282773656C65637427292E666972737428292E63737328276D617267696E546F70272920293B0D0A20202020202073687574746C65456C656D4D617267';
wwv_flow_api.g_varchar2_table(119) := '696E426F74746F6D203D207061727365496E742820746869732E656C656D656E742E66696E64282773656C65637427292E666972737428292E63737328276D617267696E426F74746F6D272920293B0D0A202020207D0D0A202020200D0A0D0A20202020';
wwv_flow_api.g_varchar2_table(120) := '68656C706572486569676874203D20746869732E68656C7065722E6F7574657248656967687428293B0D0A2020202068656C7065725769647468203D20746869732E68656C7065722E6F75746572576964746828293B0D0A0D0A20202020737769746368';
wwv_flow_api.g_varchar2_table(121) := '2820746869732E6F7074696F6E732E706F736974696F6E2029207B0D0A202020202020636173652027424F54544F4D4C454654273A202F2F72696768742074616B69652073616D6F206A616B2061626F7665206C6566740D0A2020202020202020746F70';
wwv_flow_api.g_varchar2_table(122) := '203D20656C656D656E744F66667365742E746F70202B20656C656D656E744F75746572486569676874202B206172726F7757696474683B0D0A0D0A20202020202020206966202820242E696E417272617928746869732E6F7074696F6E732E616C69676E';
wwv_flow_api.g_varchar2_table(123) := '546F2C205B27494E505554272C20274C4142454C275D29203E202D312029207B0D0A202020202020202020206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D20275354415254272029207B0D0A202020202020';
wwv_flow_api.g_varchar2_table(124) := '2020202020207269676874203D2077696E646F775769647468202D2028656C656D656E744F66667365742E6C656674202B20286172726F7750616464696E6746726F6D426F72646572202B206172726F7757696474682920293B0D0A2020202020202020';
wwv_flow_api.g_varchar2_table(125) := '20207D0D0A20202020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D20274D4944444C45272029207B0D0A2020202020202020202020207269676874203D202077696E646F775769';
wwv_flow_api.g_varchar2_table(126) := '647468202D202820656C656D656E744F66667365742E6C656674202B202820656C656D656E744F757465725769647468202F2032202029202B2028206172726F7750616464696E6746726F6D426F72646572202B206172726F775769647468202920290D';
wwv_flow_api.g_varchar2_table(127) := '0A202020202020202020207D0D0A20202020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D2027454E44272029207B0D0A2020202020202020202020207269676874203D20207769';
wwv_flow_api.g_varchar2_table(128) := '6E646F775769647468202D202820656C656D656E744F66667365742E6C656674202B2020656C656D656E744F7574657257696474682029202F2F2D2028206172726F7750616464696E6746726F6D426F7264657220202B20286172726F77576964746820';
wwv_flow_api.g_varchar2_table(129) := '2A20322920290D0A202020202020202020207D20202020202020200D0A20202020202020202020656C7365207B0D0A202020202020202020202020746869732E7468726F774572726F7228274E6965707261776964C5826F776120706F7A79636A612028';
wwv_flow_api.g_varchar2_table(130) := '53544152542C20454E442C204D4944444C45293A20272B746869732E6F7074696F6E732E616C69676E546F506F736974696F6E293B0D0A202020202020202020207D0D0A20202020202020207D0D0A2020202020202020656C7365206966202820746869';
wwv_flow_api.g_varchar2_table(131) := '732E6F7074696F6E732E616C69676E546F203D3D2027425554544F4E272029207B0D0A202020202020202020207269676874203D2077696E646F775769647468202D202820656C656D656E744F66667365742E6C656674202B202820656C656D656E744F';
wwv_flow_api.g_varchar2_table(132) := '757465725769647468202F2032202029202B20286172726F7750616464696E6746726F6D426F726465722029202B20286172726F775769647468202920293B0D0A20202020202020207D0D0A2020202020202020656C7365207B0D0A2020202020202020';
wwv_flow_api.g_varchar2_table(133) := '2020746869732E7468726F774572726F7228274E6965707261776964C5826F776120656C656D656E743A20746869732E6F7074696F6E732E616C69676E546F3D272B746869732E6F7074696F6E732E616C69676E546F293B0D0A20202020202020207D0D';
wwv_flow_api.g_varchar2_table(134) := '0A20202020202020200D0A2020202020202020746869732E68656C7065722E637373287B0D0A2020202020202020202027746F70273A20746F702C0D0A20202020202020202020277269676874273A2072696768740D0A20202020202020207D290D0A0D';
wwv_flow_api.g_varchar2_table(135) := '0A2020202020202020627265616B3B0D0A0D0A0D0A20202020202063617365202741424F56454C454654273A0D0A0D0A20202020202020206966202820242E696E417272617928746869732E6F7074696F6E732E616C69676E546F2C205B27494E505554';
wwv_flow_api.g_varchar2_table(136) := '272C20274C4142454C275D29203E202D312029207B0D0A202020202020202020206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D20275354415254272029207B0D0A2020202020202020202020207269676874';
wwv_flow_api.g_varchar2_table(137) := '203D2077696E646F775769647468202D2028656C656D656E744F66667365742E6C656674202B20286172726F7750616464696E6746726F6D426F72646572202B206172726F7757696474682920293B0D0A202020202020202020207D0D0A202020202020';
wwv_flow_api.g_varchar2_table(138) := '20202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D20274D4944444C45272029207B0D0A2020202020202020202020207269676874203D202077696E646F775769647468202D202820656C65';
wwv_flow_api.g_varchar2_table(139) := '6D656E744F66667365742E6C656674202B202820656C656D656E744F757465725769647468202F2032202029202B2028206172726F7750616464696E6746726F6D426F72646572202B206172726F775769647468202920290D0A20202020202020202020';
wwv_flow_api.g_varchar2_table(140) := '7D0D0A20202020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D2027454E44272029207B0D0A2020202020202020202020207269676874203D202077696E646F775769647468202D';
wwv_flow_api.g_varchar2_table(141) := '202820656C656D656E744F66667365742E6C656674202B2020656C656D656E744F7574657257696474682029202F2F2D2028206172726F7750616464696E6746726F6D426F7264657220202B20286172726F775769647468202A20322920290D0A202020';
wwv_flow_api.g_varchar2_table(142) := '202020202020207D20202020202020200D0A20202020202020202020656C7365207B0D0A202020202020202020202020746869732E7468726F774572726F7228274E6965707261776964C5826F776120706F7A79636A61202853544152542C20454E442C';
wwv_flow_api.g_varchar2_table(143) := '204D4944444C45293A20272B746869732E6F7074696F6E732E616C69676E546F506F736974696F6E293B0D0A202020202020202020207D0D0A0D0A20202020202020207D0D0A2020202020202020656C7365206966202820746869732E6F7074696F6E73';
wwv_flow_api.g_varchar2_table(144) := '2E616C69676E546F203D3D2027425554544F4E272029207B0D0A202020202020202020207269676874203D2077696E646F775769647468202D202820656C656D656E744F66667365742E6C656674202B202820656C656D656E744F757465725769647468';
wwv_flow_api.g_varchar2_table(145) := '202F2032202029202B20286172726F7750616464696E6746726F6D426F726465722029202B20286172726F775769647468202920293B0D0A20202020202020207D0D0A2020202020202020656C7365207B0D0A20202020202020202020746869732E7468';
wwv_flow_api.g_varchar2_table(146) := '726F774572726F7228274E6965707261776964C5826F776120656C656D656E743A20746869732E6F7074696F6E732E616C69676E546F3D272B746869732E6F7074696F6E732E616C69676E546F293B0D0A20202020202020207D0D0A0D0A202020202020';
wwv_flow_api.g_varchar2_table(147) := '20202F2F646C61207465676F2070727A797061646B752074727A656261206E616A706965727720757374617769632072696768742C20646F706965726F20706F74656D20746F700D0A20202020202020200D0A2020202020202020746869732E68656C70';
wwv_flow_api.g_varchar2_table(148) := '65722E637373287B0D0A20202020202020202020277269676874273A2072696768740D0A20202020202020207D290D0A0D0A20202020202020202F2F686569676874206F66207468652068656C706572206D696768206368616E67650D0A202020202020';
wwv_flow_api.g_varchar2_table(149) := '202068656C706572486569676874203D20746869732E68656C7065722E6F7574657248656967687428293B0D0A0D0A2020202020202020746869732E68656C7065722E637373287B0D0A20202020202020202020746F703A20656C656D656E744F666673';
wwv_flow_api.g_varchar2_table(150) := '65742E746F70202D2068656C706572486569676874202D206172726F7757696474680D0A20202020202020207D293B0D0A0D0A0D0A2020202020202020627265616B3B0D0A0D0A202020202020636173652027424F54544F4D5249474854273A0D0A2020';
wwv_flow_api.g_varchar2_table(151) := '202020202020746F70203D20656C656D656E744F66667365742E746F702B656C656D656E744F75746572486569676874202B206172726F7757696474683B0D0A0D0A20202020202020206966202820242E696E417272617928746869732E6F7074696F6E';
wwv_flow_api.g_varchar2_table(152) := '732E616C69676E546F2C205B27494E505554272C20274C4142454C275D29203E202D312029207B0D0A202020202020202020206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D20275354415254272029207B0D';
wwv_flow_api.g_varchar2_table(153) := '0A2020202020202020202020206C656674203D20656C656D656E744F66667365742E6C6566740D0A202020202020202020207D0D0A20202020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F';
wwv_flow_api.g_varchar2_table(154) := '6E203D3D20274D4944444C45272029207B0D0A2020202020202020202020206C656674203D2020656C656D656E744F66667365742E6C656674202B202820656C656D656E744F757465725769647468202F2032202029202D2028206172726F7750616464';
wwv_flow_api.g_varchar2_table(155) := '696E6746726F6D426F72646572202B206172726F77576964746820293B0D0A202020202020202020207D0D0A0D0A20202020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D202745';
wwv_flow_api.g_varchar2_table(156) := '4E44272029207B0D0A2020202020202020202020206C656674203D2020656C656D656E744F66667365742E6C656674202B20656C656D656E744F757465725769647468202D2028206172726F7750616464696E6746726F6D426F72646572202B20617272';
wwv_flow_api.g_varchar2_table(157) := '6F77576964746829202D323B0D0A202020202020202020207D20202020202020200D0A20202020202020202020656C7365207B0D0A202020202020202020202020746869732E7468726F774572726F7228274E6965707261776964C5826F776120706F7A';
wwv_flow_api.g_varchar2_table(158) := '79636A61202853544152542C20454E442C204D4944444C45293A20272B746869732E6F7074696F6E732E616C69676E546F506F736974696F6E293B0D0A202020202020202020207D0D0A20202020202020207D0D0A2020202020202020656C7365206966';
wwv_flow_api.g_varchar2_table(159) := '202820746869732E6F7074696F6E732E616C69676E546F203D3D2027425554544F4E272029207B0D0A202020202020202020206C656674203D2020656C656D656E744F66667365742E6C656674202B202820656C656D656E744F75746572576964746820';
wwv_flow_api.g_varchar2_table(160) := '2F2032202029202D2028206172726F7750616464696E6746726F6D426F72646572202B206172726F77576964746820293B0D0A20202020202020207D0D0A2020202020202020656C7365207B0D0A20202020202020202020746869732E7468726F774572';
wwv_flow_api.g_varchar2_table(161) := '726F7228274E6965707261776964C5826F776120656C656D656E743A20746869732E6F7074696F6E732E616C69676E546F3D272B746869732E6F7074696F6E732E616C69676E546F293B0D0A20202020202020207D0D0A0D0A2020202020202020746869';
wwv_flow_api.g_varchar2_table(162) := '732E68656C7065722E637373287B0D0A2020202020202020202027746F70273A20746F702C0D0A20202020202020202020276C656674273A206C6566740D0A20202020202020207D290D0A20202020202020200D0A2020202020202020627265616B3B0D';
wwv_flow_api.g_varchar2_table(163) := '0A0D0A20202020202063617365202741424F56455249474854273A0D0A0D0A20202020202020206966202820242E696E417272617928746869732E6F7074696F6E732E616C69676E546F2C205B27494E505554272C20274C4142454C275D29203E202D31';
wwv_flow_api.g_varchar2_table(164) := '2029207B0D0A202020202020202020206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D20275354415254272029207B0D0A2020202020202020202020206C656674203D20656C656D656E744F66667365742E6C';
wwv_flow_api.g_varchar2_table(165) := '6566740D0A202020202020202020207D0D0A20202020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D20274D4944444C45272029207B0D0A2020202020202020202020206C656674';
wwv_flow_api.g_varchar2_table(166) := '203D2020656C656D656E744F66667365742E6C656674202B202820656C656D656E744F757465725769647468202F2032202029202D2028206172726F7750616464696E6746726F6D426F72646572202B206172726F77576964746820293B0D0A20202020';
wwv_flow_api.g_varchar2_table(167) := '2020202020207D0D0A0D0A20202020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D2027454E44272029207B0D0A2020202020202020202020206C656674203D2020656C656D656E';
wwv_flow_api.g_varchar2_table(168) := '744F66667365742E6C656674202B20656C656D656E744F757465725769647468202D2028206172726F7750616464696E6746726F6D426F72646572202B206172726F77576964746829202D323B0D0A202020202020202020207D20202020202020200D0A';
wwv_flow_api.g_varchar2_table(169) := '20202020202020202020656C7365207B0D0A202020202020202020202020746869732E7468726F774572726F7228274E6965707261776964C5826F776120706F7A79636A61202853544152542C20454E442C204D4944444C45293A20272B746869732E6F';
wwv_flow_api.g_varchar2_table(170) := '7074696F6E732E616C69676E546F506F736974696F6E293B0D0A202020202020202020207D0D0A0D0A20202020202020207D0D0A2020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F203D3D2027425554544F';
wwv_flow_api.g_varchar2_table(171) := '4E272029207B0D0A202020202020202020206C656674203D2020656C656D656E744F66667365742E6C656674202B202820656C656D656E744F757465725769647468202F2032202029202D2028206172726F7750616464696E6746726F6D426F72646572';
wwv_flow_api.g_varchar2_table(172) := '202B206172726F77576964746820293B0D0A20202020202020207D0D0A2020202020202020656C7365207B0D0A20202020202020202020746869732E7468726F774572726F7228274E6965707261776964C5826F776120656C656D656E743A2074686973';
wwv_flow_api.g_varchar2_table(173) := '2E6F7074696F6E732E616C69676E546F3D272B746869732E6F7074696F6E732E616C69676E546F293B0D0A20202020202020207D0D0A200D0A2020202020202020746869732E68656C7065722E637373287B0D0A20202020202020202020276C65667427';
wwv_flow_api.g_varchar2_table(174) := '3A206C6566740D0A20202020202020207D290D0A0D0A202020202020202068656C706572486569676874203D20746869732E68656C7065722E6F7574657248656967687428293B0D0A0D0A2020202020202020746869732E68656C7065722E637373287B';
wwv_flow_api.g_varchar2_table(175) := '0D0A20202020202020202020746F703A20656C656D656E744F66667365742E746F70202D2068656C706572486569676874202D206172726F7757696474680D0A20202020202020207D293B0D0A0D0A0D0A2020202020202020627265616B3B0D0A0D0A20';
wwv_flow_api.g_varchar2_table(176) := '202020202063617365202741424F564543454E544552273A0D0A2020202020202020746869732E68656C7065722E637373287B0D0A20202020202020202020746F703A20656C656D656E744F66667365742E746F70202D2068656C706572486569676874';
wwv_flow_api.g_varchar2_table(177) := '202D206172726F7757696474680D0A20202020202020207D293B0D0A0D0A20202020202020206966202820242E696E417272617928746869732E6F7074696F6E732E616C69676E546F2C205B27494E505554272C20274C4142454C275D29203E202D3120';
wwv_flow_api.g_varchar2_table(178) := '29207B0D0A202020202020202020200D0A202020202020202020206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D20275354415254272029207B0D0A2020202020202020202020206C656674203D20656C656D';
wwv_flow_api.g_varchar2_table(179) := '656E744F66667365742E6C656674202D20282068656C7065725769647468202F203220290D0A202020202020202020207D0D0A20202020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E20';
wwv_flow_api.g_varchar2_table(180) := '3D3D20274D4944444C45272029207B0D0A2020202020202020202020206C656674203D2020656C656D656E744F66667365742E6C656674202B202820656C656D656E744F757465725769647468202F2032202029202D20282068656C7065725769647468';
wwv_flow_api.g_varchar2_table(181) := '202F203220293B0D0A202020202020202020207D0D0A20202020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D2027454E44272029207B0D0A2020202020202020202020206C6566';
wwv_flow_api.g_varchar2_table(182) := '74203D2020656C656D656E744F66667365742E6C656674202B20656C656D656E744F757465725769647468202D20282068656C7065725769647468202F203220293B0D0A202020202020202020207D20202020202020200D0A2020202020202020202065';
wwv_flow_api.g_varchar2_table(183) := '6C7365207B0D0A202020202020202020202020746869732E7468726F774572726F7228274E6965707261776964C5826F776120706F7A79636A61202853544152542C20454E442C204D4944444C45293A20272B746869732E6F7074696F6E732E616C6967';
wwv_flow_api.g_varchar2_table(184) := '6E546F506F736974696F6E293B0D0A202020202020202020207D0D0A0D0A0D0A20202020202020207D0D0A2020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F203D3D2027425554544F4E272029207B0D0A20';
wwv_flow_api.g_varchar2_table(185) := '2020202020202020202F2F6C656674203D2020656C656D656E744F66667365742E6C656674202D202820656C656D656E744F757465725769647468202F2032202029202D2028206172726F7750616464696E6746726F6D426F72646572202B206172726F';
wwv_flow_api.g_varchar2_table(186) := '77576964746820293B200D0A202020202020202020206C656674203D2020746869732E68656C7065722E697328272E6C656674302729203F2030203A20656C656D656E744F66667365742E6C656674202D20282068656C7065725769647468202F203220';
wwv_flow_api.g_varchar2_table(187) := '2029202B20656C656D656E744F757465725769647468202F20323B200D0A202020202020202020202F2F276C656674273A20746869732E68656C7065722E697328272E6C656674302729203F2030203A20656C656D656E744F66667365742E6C65667420';
wwv_flow_api.g_varchar2_table(188) := '2D206172726F775769647468202D2068656C70657257696474680D0A20202020202020207D0D0A2020202020202020656C7365207B0D0A20202020202020202020746869732E7468726F774572726F7228274E6965707261776964C5826F776120656C65';
wwv_flow_api.g_varchar2_table(189) := '6D656E743A20746869732E6F7074696F6E732E616C69676E546F3D272B746869732E6F7074696F6E732E616C69676E546F293B0D0A20202020202020207D0D0A0D0A0D0A2020202020202020746869732E68656C7065722E637373287B0D0A2020202020';
wwv_flow_api.g_varchar2_table(190) := '2020202020276C656674273A206C6566740D0A20202020202020207D293B0D0A2020202020202020627265616B3B0D0A0D0A202020202020636173652027424F54544F4D43454E544552273A0D0A2020202020202020746869732E68656C7065722E6373';
wwv_flow_api.g_varchar2_table(191) := '73287B0D0A20202020202020202020746F703A20656C656D656E744F66667365742E746F702B656C656D656E744F75746572486569676874202B206172726F7757696474680D0A20202020202020207D293B0D0A0D0A2020202020202020696620282024';
wwv_flow_api.g_varchar2_table(192) := '2E696E417272617928746869732E6F7074696F6E732E616C69676E546F2C205B27494E505554272C20274C4142454C275D29203E202D312029207B0D0A202020202020202020200D0A202020202020202020206966202820746869732E6F7074696F6E73';
wwv_flow_api.g_varchar2_table(193) := '2E616C69676E546F506F736974696F6E203D3D20275354415254272029207B0D0A2020202020202020202020206C656674203D20656C656D656E744F66667365742E6C656674202D20282068656C7065725769647468202F203220290D0A202020202020';
wwv_flow_api.g_varchar2_table(194) := '202020207D0D0A20202020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D20274D4944444C45272029207B0D0A2020202020202020202020206C656674203D2020656C656D656E74';
wwv_flow_api.g_varchar2_table(195) := '4F66667365742E6C656674202B202820656C656D656E744F757465725769647468202F2032202029202D20282068656C7065725769647468202F203220293B0D0A202020202020202020207D0D0A20202020202020202020656C73652069662028207468';
wwv_flow_api.g_varchar2_table(196) := '69732E6F7074696F6E732E616C69676E546F506F736974696F6E203D3D2027454E44272029207B0D0A2020202020202020202020206C656674203D2020656C656D656E744F66667365742E6C656674202B20656C656D656E744F75746572576964746820';
wwv_flow_api.g_varchar2_table(197) := '2D20282068656C7065725769647468202F203220293B0D0A202020202020202020207D20202020202020200D0A20202020202020202020656C7365207B0D0A202020202020202020202020746869732E7468726F774572726F7228274E69657072617769';
wwv_flow_api.g_varchar2_table(198) := '64C5826F776120706F7A79636A61202853544152542C20454E442C204D4944444C45293A20272B746869732E6F7074696F6E732E616C69676E546F506F736974696F6E293B0D0A202020202020202020207D0D0A0D0A20202020202020207D0D0A202020';
wwv_flow_api.g_varchar2_table(199) := '2020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F203D3D2027425554544F4E272029207B0D0A202020202020202020202F2F6C656674203D2020656C656D656E744F66667365742E6C656674202B202820656C656D';
wwv_flow_api.g_varchar2_table(200) := '656E744F757465725769647468202F2032202029202D2028206172726F7750616464696E6746726F6D426F72646572202B206172726F77576964746820293B200D0A202020202020202020206C656674203D2020656C656D656E744F66667365742E6C65';
wwv_flow_api.g_varchar2_table(201) := '6674202D20282068656C7065725769647468202F2032202029202B20656C656D656E744F757465725769647468202F20323B0D0A20202020202020207D0D0A2020202020202020656C7365207B0D0A20202020202020202020746869732E7468726F7745';
wwv_flow_api.g_varchar2_table(202) := '72726F7228274E6965707261776964C5826F776120656C656D656E743A20746869732E6F7074696F6E732E616C69676E546F3D272B746869732E6F7074696F6E732E616C69676E546F293B0D0A20202020202020207D0D0A0D0A0D0A2020202020202020';
wwv_flow_api.g_varchar2_table(203) := '746869732E68656C7065722E637373287B0D0A20202020202020202020276C656674273A206C6566740D0A20202020202020207D290D0A2020202020202020627265616B3B0D0A2020202020202F2F7A6177737A65206D6964646C650D0A202020202020';
wwv_flow_api.g_varchar2_table(204) := '6361736520275249474854273A0D0A2020202020202020746869732E68656C7065722E637373287B0D0A2020202020202020202027746F70273A20656C656D656E744F66667365742E746F70202D2068656C7065724865696768742F32202B20656C656D';
wwv_flow_api.g_varchar2_table(205) := '656E744865696768742F322C0D0A20202020202020202020276C656674273A20656C656D656E744F66667365742E6C656674202B20656C656D656E744F757465725769647468202B206172726F77576964746820202020202020200D0A20202020202020';
wwv_flow_api.g_varchar2_table(206) := '207D293B0D0A0D0A2020202020202020627265616B3B0D0A2020202020206361736520275249474854544F50273A0D0A20202020202020206966202820242E696E417272617928746869732E6F7074696F6E732E616C69676E546F2C205B27494E505554';
wwv_flow_api.g_varchar2_table(207) := '272C20274C4142454C275D29203E202D312029207B0D0A20202020202020202020746F70203D20656C656D656E744F66667365742E746F70202B2073687574746C65456C656D4D617267696E546F703B0D0A20202020202020207D0D0A20202020202020';
wwv_flow_api.g_varchar2_table(208) := '20656C7365206966202820746869732E6F7074696F6E732E616C69676E546F203D3D2027425554544F4E272029207B0D0A20202020202020202020746F70203D20656C656D656E744F66667365742E746F70202B20656C656D656E744F75746572486569';
wwv_flow_api.g_varchar2_table(209) := '6768742F323B0D0A20202020202020207D0D0A0D0A2020202020202020746869732E68656C7065722E637373287B0D0A2020202020202020202027746F70273A20746F700D0A20202020202020207D293B0D0A0D0A20200D0A2020202020202020746869';
wwv_flow_api.g_varchar2_table(210) := '732E68656C7065722E637373287B0D0A202020202020202020206C6566743A20656C656D656E744F66667365742E6C656674202B20656C656D656E744F757465725769647468202B206172726F77576964746820202020202020200D0A20202020202020';
wwv_flow_api.g_varchar2_table(211) := '207D293B0D0A2020202020202020627265616B3B0D0A2020202020206361736520275249474854424F54544F4D273A0D0A20202020202020206966202820242E696E417272617928746869732E6F7074696F6E732E616C69676E546F2C205B27494E5055';
wwv_flow_api.g_varchar2_table(212) := '54272C20274C4142454C275D29203E202D312029207B0D0A20202020202020202020746F70203D20656C656D656E744F66667365742E746F70202B20656C656D656E744F75746572486569676874202D20746869732E68656C7065722E6F757465724865';
wwv_flow_api.g_varchar2_table(213) := '696768742829202D2073687574746C65456C656D4D617267696E426F74746F6D3B200D0A20202020202020207D0D0A2020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F203D3D2027425554544F4E27202920';
wwv_flow_api.g_varchar2_table(214) := '7B0D0A20202020202020202020746F70203D20656C656D656E744F66667365742E746F70202B20656C656D656E744F757465724865696768742F32202D20746869732E68656C7065722E6F7574657248656967687428290D0A20202020202020207D0D0A';
wwv_flow_api.g_varchar2_table(215) := '0D0A2020202020202020746869732E68656C7065722E637373287B0D0A2020202020202020202027746F70273A20746F702C0D0A20202020202020202020276C656674273A20656C656D656E744F66667365742E6C656674202B20656C656D656E744F75';
wwv_flow_api.g_varchar2_table(216) := '7465725769647468202B206172726F77576964746820202020202020200D0A20202020202020207D293B0D0A0D0A2020202020202020627265616B3B0D0A0D0A2020202020206361736520274C454654273A0D0A2020202020202020746869732E68656C';
wwv_flow_api.g_varchar2_table(217) := '7065722E637373287B0D0A2020202020202020202027746F70273A20656C656D656E744F66667365742E746F70202D2068656C7065724865696768742F32202B20656C656D656E744865696768742F322C202020202020202020200D0A20202020202020';
wwv_flow_api.g_varchar2_table(218) := '202020276C656674273A20746869732E68656C7065722E697328272E6C656674302729203F2030203A20656C656D656E744F66667365742E6C656674202D206172726F775769647468202D2068656C70657257696474680D0A20202020202020207D290D';
wwv_flow_api.g_varchar2_table(219) := '0A2020202020202020627265616B3B0D0A0D0A2020202020206361736520274C454654544F50273A0D0A20202020202020206966202820242E696E417272617928746869732E6F7074696F6E732E616C69676E546F2C205B27494E505554272C20274C41';
wwv_flow_api.g_varchar2_table(220) := '42454C275D29203E202D312029207B0D0A20202020202020202020746F70203D20656C656D656E744F66667365742E746F70202B2073687574746C65456C656D4D617267696E546F700D0A20202020202020207D0D0A2020202020202020656C73652069';
wwv_flow_api.g_varchar2_table(221) := '66202820746869732E6F7074696F6E732E616C69676E546F203D3D2027425554544F4E272029207B0D0A20202020202020202020746F70203D20656C656D656E744F66667365742E746F70202B20656C656D656E744F757465724865696768742F323B0D';
wwv_flow_api.g_varchar2_table(222) := '0A20202020202020207D0D0A20202020202020200D0A2020202020202020746869732E68656C7065722E637373287B0D0A2020202020202020202027746F70273A20746F702C0D0A20202020202020202020276C656674273A20746869732E68656C7065';
wwv_flow_api.g_varchar2_table(223) := '722E697328272E6C656674302729203F2030203A20656C656D656E744F66667365742E6C656674202D206172726F775769647468202D2068656C70657257696474680D0A20202020202020207D293B0D0A2020202020202020627265616B3B0D0A202020';
wwv_flow_api.g_varchar2_table(224) := '2020206361736520274C454654424F54544F4D273A0D0A20202020202020206966202820242E696E417272617928746869732E6F7074696F6E732E616C69676E546F2C205B27494E505554272C20274C4142454C275D29203E202D312029207B0D0A2020';
wwv_flow_api.g_varchar2_table(225) := '2020202020202020746F70203D20656C656D656E744F66667365742E746F70202B20656C656D656E744F75746572486569676874202D20746869732E68656C7065722E6F757465724865696768742829202D2073687574746C65456C656D4D617267696E';
wwv_flow_api.g_varchar2_table(226) := '426F74746F6D0D0A20202020202020207D0D0A2020202020202020656C7365206966202820746869732E6F7074696F6E732E616C69676E546F203D3D2027425554544F4E272029207B0D0A20202020202020202020746F70203D20656C656D656E744F66';
wwv_flow_api.g_varchar2_table(227) := '667365742E746F70202B20656C656D656E744F757465724865696768742F32202D20746869732E68656C7065722E6F7574657248656967687428290D0A20202020202020207D0D0A0D0A2020202020202020746869732E68656C7065722E637373287B0D';
wwv_flow_api.g_varchar2_table(228) := '0A2020202020202020202027746F70273A20746F702C0D0A20202020202020202020276C656674273A20746869732E68656C7065722E697328272E6C656674302729203F2030203A20656C656D656E744F66667365742E6C656674202D206172726F7757';
wwv_flow_api.g_varchar2_table(229) := '69647468202D2068656C70657257696474680D0A20202020202020207D293B0D0A2020202020202020627265616B3B0D0A0D0A202020207D202020200D0A0D0A20207D2C0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(230) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A0D0A202073686F773A2066756E6374';
wwv_flow_api.g_varchar2_table(231) := '696F6E28297B0D0A202020202F2F69662069732073686F776E2C20646F206E74680D0A202020206966202820746869732E697348656C70657253686F776E2029207B0D0A20202020202072657475726E20766F69642830293B0D0A202020207D0D0A0D0A';
wwv_flow_api.g_varchar2_table(232) := '202020202F2F696620616A61782069732072756E6E696E672C20646F206E74680D0A202020206966202820746869732E6973416A617852756E6E696E672029207B0D0A20202020202072657475726E206E756C6C3B0D0A202020207D0D0A0D0A20202020';
wwv_flow_api.g_varchar2_table(233) := '2F2F69662068656C702074657874206973206E6F742079657420666574636865642075736520414A41580D0A202020206966202820746869732E68656C705465787448746D6C203D3D206E756C6C29207B0D0A202020202020746869732E5F6765744865';
wwv_flow_api.g_varchar2_table(234) := '6C7054657874416E6453686F7728293B0D0A20202020202072657475726E206E756C6C3B0D0A202020207D0D0A20202020656C7365207B0D0A2020202020202F2F68696465206F746865722068656C706572730D0A202020202020696620282074686973';
wwv_flow_api.g_varchar2_table(235) := '2E6F7074696F6E732E686964654F74686572203D3D20274441272029207B0D0A20202020202020202428746869732E6F7074696F6E732E6461496E70757473292E6E6F742820746869732E656C656D656E7420292E6170657868656C7065722827686964';
wwv_flow_api.g_varchar2_table(236) := '6527293B0D0A2020202020207D0D0A202020202020656C7365206966202820746869732E6F7074696F6E732E686964654F74686572203D3D2027414C4C272029207B0D0A20202020202020202428272E707265746975732D2D6170657868656C70657227';
wwv_flow_api.g_varchar2_table(237) := '292E6E6F742820746869732E656C656D656E7420292E6170657868656C70657228276869646527293B0D0A2020202020207D0D0A0D0A202020202020746869732E5F6472617748656C70657228293B0D0A202020207D0D0A0D0A0D0A20207D2C0D0A2020';
wwv_flow_api.g_varchar2_table(238) := '2F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(239) := '2D2D2D2D2D0D0A20202F2F0D0A20205F6465636F6465556E69636F64653A2066756E6374696F6E2820737472696E6720297B0D0A2020202072657475726E20737472696E672E7265706C616365282F5C5C75285B5C645C775D7B347D292F67692C206675';
wwv_flow_api.g_varchar2_table(240) := '6E6374696F6E20286D617463682C2067727029207B0D0A20202020202072657475726E20537472696E672E66726F6D43686172436F6465287061727365496E74286772702C20313629293B200D0A202020207D293B0D0A20207D2C0D0A20205F64726177';
wwv_flow_api.g_varchar2_table(241) := '48656C7065723A2066756E6374696F6E28297B0D0A20202020746869732E68656C7065722E66696E6428272E636F6E74656E7427292E68746D6C2820273C6469763E272B746869732E68656C705465787448746D6C2B273C2F6469763E2720293B0D0A0D';
wwv_flow_api.g_varchar2_table(242) := '0A20202020746869732E5F627574746F6E4368616E676549636F6E28276F70656E656427293B0D0A20202020746869732E68656C7065722E616464436C617373282776697369626C6527293B20200D0A20202020746869732E656C656D656E742E616464';
wwv_flow_api.g_varchar2_table(243) := '436C617373282027707265746975732D2D686967686C696768742720293B0D0A20202020746869732E697348656C70657253686F776E203D20747275653B202020200D0A0D0A20202020746869732E68656C7065722E73686F7728290D0A202020207468';
wwv_flow_api.g_varchar2_table(244) := '69732E5F736574506F736974696F6E28293B0D0A0D0A202020206966202820746869732E5F636865636B4C656674536964652829203D3D2066616C73652029207B0D0A202020202020746869732E68656C7065722E6869646528293B0D0A202020202020';
wwv_flow_api.g_varchar2_table(245) := '746869732E5F6472617748656C70657228293B0D0A20202020202072657475726E20766F69642830293B0D0A202020207D0D0A20202020746869732E5F636865636B52696768745369646528293B0D0A0D0A20202020746869732E68656C7065722E6869';
wwv_flow_api.g_varchar2_table(246) := '646528292E66616465496E283230302C20242E70726F7879282066756E6374696F6E28297B0D0A202020202020746869732E5F636865636B48656967687428293B0D0A202020207D2C20746869732029293B0D0A0D0A20207D2C0D0A20205F636865636B';
wwv_flow_api.g_varchar2_table(247) := '4865696768743A2066756E6374696F6E28297B0D0A202020206966202820746869732E68656C7065722E6F757465724865696768742829203C20746869732E68656C7065722E66696E6428272E636F6E74656E74203E2064697627292E6F757465724865';
wwv_flow_api.g_varchar2_table(248) := '6967687428292029207B0D0A202020202020746869732E68656C7065722E616464436C6173732827636F6E74656E744F766572666C6F77656427293B0D0A202020207D0D0A20207D2C0D0A20205F636865636B4C656674536964653A2066756E6374696F';
wwv_flow_api.g_varchar2_table(249) := '6E28297B0D0A20202020766172206F72675269676874203D207061727365496E742820746869732E68656C7065722E63737328277269676874272920293B0D0A20202020766172206F72674C656674203D20746869732E68656C7065722E6F6666736574';
wwv_flow_api.g_varchar2_table(250) := '28292E6C6566743B0D0A202020207661722068656C7065725769647468203D20746869732E68656C7065722E6F75746572576964746828293B0D0A202020200D0A202020200D0A2020202069662028206F72674C656674203C20302029207B0D0A202020';
wwv_flow_api.g_varchar2_table(251) := '2020206966202820746869732E68656C7065722E697328272E6F70656E732D2D6C65667427292029207B0D0A2020202020202020746869732E68656C7065722E637373287B0D0A20202020202020202020276C656674273A20302C0D0A20202020202020';
wwv_flow_api.g_varchar2_table(252) := '202020277769647468273A20746869732E656C656D656E742E6F666673657428292E6C656674202D20370D0A20202020202020207D293B0D0A0D0A2020202020202020746869732E68656C7065722E616464436C6173732820276C656674302720293B0D';
wwv_flow_api.g_varchar2_table(253) := '0A2020202020207D0D0A202020202020656C73652069662028200D0A2020202020202020746869732E68656C7065722E697328272E6F70656E732D2D746F702E63656E7465722729200D0A20202020202020207C7C20746869732E68656C7065722E6973';
wwv_flow_api.g_varchar2_table(254) := '28272E6F70656E732D2D626F74746F6D2E63656E74657227290D0A20202020202029207B0D0A2020202020202020746869732E68656C7065722E637373287B0D0A20202020202020202020276C656674273A20302C0D0A20202020202020202020277769';
wwv_flow_api.g_varchar2_table(255) := '647468273A20746869732E68656C7065722E6F7574657257696474682829202D204D6174682E6365696C28204D6174682E61627328206F72674C65667420292029202D20350D0A20202020202020207D293B0D0A0D0A2020202020202020746869732E68';
wwv_flow_api.g_varchar2_table(256) := '656C7065722E616464436C6173732820276C656674302720293B0D0A20202020202020200D0A2020202020207D0D0A202020202020656C7365206966202820746869732E68656C7065722E697328272E6F70656E732D2D746F702E6C6566742729202920';
wwv_flow_api.g_varchar2_table(257) := '7B0D0A20202020202020202F2F73686F756C64206E6F742068617070656E206265636175736520637373207269676874206973207365740D0A2020202020207D0D0A2020202020202F2F646F206F6273C58275C5BC656E6961206F70656E732D2D746F70';
wwv_flow_api.g_varchar2_table(258) := '206C6566740D0A202020202020656C7365207B0D0A20202020202020202F2F746869732E68656C7065722E63737328277269676874272C202727293B0D0A2020202020202020746869732E68656C7065722E63737328277269676874272C206F72675269';
wwv_flow_api.g_varchar2_table(259) := '676874202D204D6174682E616273286F72674C65667429202D203130290D0A2020202020207D0D0A0D0A20202020202072657475726E2066616C73653B0D0A0D0A202020207D0D0A0D0A2020202072657475726E20747275653B0D0A0D0A20207D2C0D0A';
wwv_flow_api.g_varchar2_table(260) := '20205F666978546F703A2066756E6374696F6E28297B0D0A0D0A20207D2C0D0A20205F636865636B5269676874536964653A2066756E6374696F6E28297B0D0A202020206966202820746869732E68656C7065722E6F666673657428292E726967687420';
wwv_flow_api.g_varchar2_table(261) := '3E20242877696E646F77292E6F757465724865696768742029207B0D0A2020202020206E756C6C3B0D0A2020202020202F2F7468726F77202243686F776120736965207A61207072617761206772616E6963612070727A65676C616461726B69223B0D0A';
wwv_flow_api.g_varchar2_table(262) := '202020202020636F6E736F6C652E6C6F672827746F2062652066697865643A20666C6F6174696E67206265796F6E642072696768742073696465206F662073637265656E2E27293B0D0A202020207D0D0A20207D2C0D0A20205F627574746F6E4368616E';
wwv_flow_api.g_varchar2_table(263) := '676549636F6E3A2066756E6374696F6E28207768617420297B0D0A20202020766172207370616E203D20746869732E68656C70427574746F6E2E66696E6428277370616E27293B0D0A0D0A20202020696620282077686174203D3D20276C6F6164696E67';
wwv_flow_api.g_varchar2_table(264) := '272029207B0D0A2020202020207370616E2E72656D6F7665417474722827636C61737327292E616464436C617373282766612066612D7370696E6E65722066612D7370696E20707265746975734170657848656C70657227293B0D0A202020207D0D0A20';
wwv_flow_api.g_varchar2_table(265) := '202020656C736520696620282077686174203D3D20276572726F72272029207B0D0A2020202020207370616E2E72656D6F7665417474722827636C61737327292E616464436C617373282766612066612D6578636C616D6174696F6E2D747269616E676C';
wwv_flow_api.g_varchar2_table(266) := '6520707265746975734170657848656C70657227293B0D0A202020202020746869732E697348656C70657253686F776E203D2066616C73653B0D0A202020207D0D0A20202020656C736520696620282077686174203D3D20276F70656E6564272029207B';
wwv_flow_api.g_varchar2_table(267) := '0D0A2020202020207370616E2E72656D6F7665417474722827636C61737327292E616464436C617373282766612066612D74696D65732D636972636C652D6F20707265746975734170657848656C70657227293B0D0A202020202020746869732E697348';
wwv_flow_api.g_varchar2_table(268) := '656C70657253686F776E203D20747275653B0D0A202020207D0D0A20202020656C7365207B202F2F696E697469616C0D0A2020202020207370616E2E72656D6F7665417474722827636C61737327292E616464436C6173732820746869732E627574746F';
wwv_flow_api.g_varchar2_table(269) := '6E49636F6E20293B0D0A202020202020746869732E697348656C70657253686F776E203D2066616C73653B0D0A202020207D0D0A0D0A20207D2C0D0A20205F616A617853746172743A2066756E6374696F6E28297B0D0A20202020746869732E6973416A';
wwv_flow_api.g_varchar2_table(270) := '617852756E6E696E67203D20747275653B0D0A20202020746869732E5F627574746F6E4368616E676549636F6E28276C6F6164696E6727293B0D0A0D0A20207D2C0D0A20205F616A6178456E643A2066756E6374696F6E28297B0D0A2020202074686973';
wwv_flow_api.g_varchar2_table(271) := '2E6973416A617852756E6E696E67203D2066616C73653B0D0A20202020746869732E5F627574746F6E4368616E676549636F6E2827696E697469616C27293B0D0A20207D2C0D0A20205F67657448656C7054657874416E6453686F773A2066756E637469';
wwv_flow_api.g_varchar2_table(272) := '6F6E28297B0D0A202020202F2F646174612D6974656D68656C703D22313637343534393030333537363231343230220D0A20202020766172200D0A2020202020206F626A203D20746869732C0D0A20202020202070416A617843616C6C6261636B4E616D';
wwv_flow_api.g_varchar2_table(273) := '65203D20746869732E6F7074696F6E732E616A617849642C0D0A2020202020207044617461203D207B0D0A2020202020202020747970653A2022474554222C0D0A20202020202020206461746154797065203A20226A736F6E222C0D0A20202020202020';
wwv_flow_api.g_varchar2_table(274) := '207830313A20746869732E656C656D656E742E70726F702827696427290D0A2020202020207D2C0D0A0D0A202020202020704F7074696F6E73203D207B0D0A2020202020202020737563636573733A20242E70726F78792866756E6374696F6E28207044';
wwv_flow_api.g_varchar2_table(275) := '6174612C20746578745374617475732C206A715848522029207B0D0A0D0A2020202020202020202070446174612E726573756C742E68656C70203D20746869732E5F6465636F6465556E69636F6465282070446174612E726573756C742E68656C702029';
wwv_flow_api.g_varchar2_table(276) := '3B0D0A20202020202020202020746869732E68656C705465787448746D6C203D2070446174612E726573756C742E68656C703B0D0A20202020202020202020746869732E5F616A6178456E6428293B0D0A20202020202020202020746869732E73686F77';
wwv_flow_api.g_varchar2_table(277) := '28293B0D0A202020202020202020200D0A20202020202020207D2C2074686973292C0D0A20202020202020206572726F723A20242E70726F78792866756E6374696F6E28206A715848522C20746578745374617475732C206572726F725468726F776E20';
wwv_flow_api.g_varchar2_table(278) := '29207B0D0A20202020202020202020746869732E5F616A6178456E6428293B0D0A20202020202020202020746869732E5F627574746F6E4368616E676549636F6E28276572726F7227293B0D0A202020202020202020207468726F7720226572726F7254';
wwv_flow_api.g_varchar2_table(279) := '68726F776E2E6D73673A20222B6572726F725468726F776E2E6D73672B272C206572726F725468726F776E2E646573633A20272B6572726F725468726F776E2E646573633B0D0A202020202020202020202F2F7468726F77202274657874537461747573';
wwv_flow_api.g_varchar2_table(280) := '3A20222B746578745374617475732B222C206572726F725468726F776E3A20222B6572726F725468726F776E3B0D0A20202020202020207D2C2074686973290D0A2020202020207D3B0D0A0D0A20202020746869732E5F616A6178537461727428293B0D';
wwv_flow_api.g_varchar2_table(281) := '0A20202020617065782E7365727665722E706C7567696E20282070416A617843616C6C6261636B4E616D652C2070446174612C20704F7074696F6E7320293B0D0A20207D2C0D0A0D0A20202F2F0D0A20202F2F2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D';
wwv_flow_api.g_varchar2_table(282) := '2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D0D0A20202F2F0D0A0D0A20207468726F77457272';
wwv_flow_api.g_varchar2_table(283) := '6F723A2066756E6374696F6E28207465787420297B0D0A202020202F2F636F6E736F6C652E6C6F672827506C7567696E206572726F723A20272B74657874293B0D0A20202020636F6E736F6C652E6C6F672820746869732E656C656D656E742E67657428';
wwv_flow_api.g_varchar2_table(284) := '302920290D0A202020207468726F772027506C7567696E206572726F723A20272B746578743B0D0A20207D0D0A7D293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(175809186677995444)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_file_name=>'pretius.apexhelper.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2E707265746975732D2D746F6F6C7469702D7469746C65207B0D0A2020646973706C61793A20626C6F636B3B0D0A202070616464696E673A20313070783B0D0A2020666F6E742D73697A653A313470783B0D0A20206C696E652D6865696768743A203138';
wwv_flow_api.g_varchar2_table(2) := '70783B0D0A20206261636B67726F756E643A2072676261283231302C203231302C203231302C20302E3138293B0D0A2020626F726465722D626F74746F6D3A2031707820736F6C696420236432643264323B20200D0A7D0D0A2E707265746975732D2D68';
wwv_flow_api.g_varchar2_table(3) := '6967686C69676874207B0D0A7D0D0A0D0A2E707265746975732D2D746F6F6C7469703A686F766572202E707265746975732D2D746F6F6C7469702D636C6F7365207B0D0A20206F7061636974793A20302E353B0D0A2020637572736F723A20706F696E74';
wwv_flow_api.g_varchar2_table(4) := '65723B0D0A20202D7765626B69742D7472616E736974696F6E3A206F706163697479202E357320656173652D696E2D6F75743B0D0A20202D6D6F7A2D7472616E736974696F6E3A206F706163697479202E357320656173652D696E2D6F75743B0D0A2020';
wwv_flow_api.g_varchar2_table(5) := '2D6D732D7472616E736974696F6E3A206F706163697479202E357320656173652D696E2D6F75743B0D0A20202D6F2D7472616E736974696F6E3A206F706163697479202E357320656173652D696E2D6F75743B0D0A20207472616E736974696F6E3A206F';
wwv_flow_api.g_varchar2_table(6) := '706163697479202E357320656173652D696E2D6F75743B20200D0A7D0D0A2E707265746975732D2D746F6F6C7469702E636F6E74656E744F766572666C6F776564202E707265746975732D2D746F6F6C7469702D636C6F7365207B0D0A20207269676874';
wwv_flow_api.g_varchar2_table(7) := '3A20323570783B0D0A7D0D0A0D0A2E707265746975732D2D746F6F6C7469702E73686F775469746C65202E707265746975732D2D746F6F6C7469702D636C6F73652C0D0A2E707265746975732D2D746F6F6C7469702E73686F775469746C652E636F6E74';
wwv_flow_api.g_varchar2_table(8) := '656E744F766572666C6F776564202E707265746975732D2D746F6F6C7469702D636C6F7365207B0D0A202072696768743A20313070783B0D0A2020746F703A20313070783B0D0A0D0A7D0D0A0D0A0D0A2E707265746975732D2D746F6F6C7469702D636C';
wwv_flow_api.g_varchar2_table(9) := '6F7365207B0D0A2020706F736974696F6E3A206162736F6C7574653B0D0A202072696768743A203570783B0D0A2020746F703A203570783B0D0A2020666F6E742D73697A653A313270783B0D0A20206C696E652D6865696768743A20313270783B0D0A20';
wwv_flow_api.g_varchar2_table(10) := '206F7061636974793A20303B0D0A20202D7765626B69742D7472616E736974696F6E3A206F706163697479202E357320656173652D696E2D6F75743B0D0A20202D6D6F7A2D7472616E736974696F6E3A206F706163697479202E357320656173652D696E';
wwv_flow_api.g_varchar2_table(11) := '2D6F75743B0D0A20202D6D732D7472616E736974696F6E3A206F706163697479202E357320656173652D696E2D6F75743B0D0A20202D6F2D7472616E736974696F6E3A206F706163697479202E357320656173652D696E2D6F75743B0D0A20207472616E';
wwv_flow_api.g_varchar2_table(12) := '736974696F6E3A206F706163697479202E357320656173652D696E2D6F75743B20200D0A7D0D0A0D0A2E707265746975732D2D746F6F6C7469702E76697369626C65207B0D0A2020646973706C61793A20696E6C696E652D626C6F636B3B0D0A7D0D0A0D';
wwv_flow_api.g_varchar2_table(13) := '0A2E707265746975732D2D746F6F6C746970207B0D0A2020646973706C61793A206E6F6E653B0D0A20206261636B67726F756E643A20236666663B0D0A2020706F736974696F6E3A206162736F6C7574653B0D0A2020626F782D736861646F773A203070';
wwv_flow_api.g_varchar2_table(14) := '78203070782031357078207267626128302C20302C20302C20302E31293B0D0A2020626F726465723A2031707820736F6C696420236432643264323B0D0A2020626F782D73697A696E673A20626F726465722D626F783B0D0A20207A2D696E6465783A20';
wwv_flow_api.g_varchar2_table(15) := '3438303B0D0A7D0D0A0D0A2E707265746975732D2D746F6F6C7469702E73686F775469746C65202E707265746975732D2D746F6F6C7469702D7469746C65207B0D0A2020646973706C61793A20626C6F636B3B0D0A7D0D0A0D0A2E707265746975732D2D';
wwv_flow_api.g_varchar2_table(16) := '746F6F6C746970202E707265746975732D2D746F6F6C7469702D7469746C65207B0D0A2020646973706C61793A206E6F6E653B0D0A7D0D0A0D0A2E707265746975732D2D746F6F6C746970202E636F6E74656E74207B0D0A202070616464696E673A2031';
wwv_flow_api.g_varchar2_table(17) := '3070782032307078203130707820313570783B0D0A20206F766572666C6F773A206175746F3B0D0A7D0D0A0D0A2E707265746975732D2D746F6F6C7469702E73686F775469746C65202E636F6E74656E74207B0D0A202070616464696E672D7269676874';
wwv_flow_api.g_varchar2_table(18) := '3A20313570783B0D0A7D0D0A0D0A0D0A2F2A206172726F777320696E2067656E6572616C202A2F0D0A2E707265746975732D2D746F6F6C7469703A61667465722C0D0A2E707265746975732D2D746F6F6C7469703A6265666F7265207B0D0A2020626F72';
wwv_flow_api.g_varchar2_table(19) := '6465722D746F703A2037707820736F6C6964207472616E73706172656E743B0D0A2020626F726465722D626F74746F6D3A2037707820736F6C6964207472616E73706172656E743B0D0A2020626F726465722D72696768743A2037707820736F6C696420';
wwv_flow_api.g_varchar2_table(20) := '7472616E73706172656E743B0D0A2020626F726465722D6C6566743A2037707820736F6C6964207472616E73706172656E743B0D0A2020706F736974696F6E3A206162736F6C7574653B0D0A2020646973706C61793A20696E6C696E652D626C6F636B3B';
wwv_flow_api.g_varchar2_table(21) := '0D0A2020636F6E74656E743A2027273B202020200D0A7D0D0A0D0A2F2A20746F7020616E6420626F74746F6D2063656E746572202A2F0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D746F702E63656E7465723A6265666F72652C0D';
wwv_flow_api.g_varchar2_table(22) := '0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D746F702E63656E7465723A61667465722C0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D626F74746F6D2E63656E7465723A6265666F72652C0D0A2E707265746975';
wwv_flow_api.g_varchar2_table(23) := '732D2D746F6F6C7469702E6F70656E732D2D626F74746F6D2E63656E7465723A6166746572207B0D0A20206C6566743A2063616C63283530252D377078293B0D0A20206C6566743A202D6D6F7A2D63616C6328353025202D20377078293B202020202F2A';
wwv_flow_api.g_varchar2_table(24) := '2046697265666F78202A2F0D0A20206C6566743A202D7765626B69742D63616C6328353025202D20377078293B202F2A205765624B6974202A2F0D0A20206C6566743A202D6F2D63616C6328353025202D20377078293B2020202020202F2A204F706572';
wwv_flow_api.g_varchar2_table(25) := '61202A2F0D0A20206C6566743A2063616C6328353025202D20377078293B2020202020202020202F2A205374616E64617264202A2F0D0A7D0D0A0D0A2F2A206C65667420616E64207269676874206D6964646C65202A2F0D0A2E707265746975732D2D74';
wwv_flow_api.g_varchar2_table(26) := '6F6F6C7469702E6F70656E732D2D6C6566743A6265666F72652C0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D6C6566743A61667465722C0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D72696768743A626566';
wwv_flow_api.g_varchar2_table(27) := '6F72652C0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D72696768743A6166746572207B0D0A2020746F703A2063616C63283530252D377078293B0D0A2020746F703A202D6D6F7A2D63616C6328353025202D20377078293B202020';
wwv_flow_api.g_varchar2_table(28) := '202F2A2046697265666F78202A2F0D0A2020746F703A202D7765626B69742D63616C6328353025202D20377078293B202F2A205765624B6974202A2F0D0A2020746F703A202D6F2D63616C6328353025202D20377078293B2020202020202F2A204F7065';
wwv_flow_api.g_varchar2_table(29) := '7261202A2F0D0A2020746F703A2063616C6328353025202D20377078293B2020202020202020202F2A205374616E64617264202A2F0D0A7D0D0A0D0A2F2A20746F702C20626F74746F6D20746F20746865206C656674202A2F0D0A2E707265746975732D';
wwv_flow_api.g_varchar2_table(30) := '2D746F6F6C7469702E6F70656E732D2D746F702E6C6566743A6265666F72652C0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D746F702E6C6566743A61667465722C0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D';
wwv_flow_api.g_varchar2_table(31) := '2D626F74746F6D2E6C6566743A6265666F72652C0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D626F74746F6D2E6C6566743A6166746572207B0D0A202072696768743A203570783B0D0A202072696768743A203570783B0D0A0D0A';
wwv_flow_api.g_varchar2_table(32) := '7D0D0A0D0A2F2A20746F702C20626F74746F6D20746F20746865207269676874202A2F0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D746F702E72696768743A6265666F72652C0D0A2E707265746975732D2D746F6F6C7469702E6F';
wwv_flow_api.g_varchar2_table(33) := '70656E732D2D746F702E72696768743A61667465722C0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D626F74746F6D2E72696768743A6265666F72652C0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D626F7474';
wwv_flow_api.g_varchar2_table(34) := '6F6D2E72696768743A6166746572207B0D0A20206C6566743A203570783B0D0A20206C6566743A203570783B0D0A0D0A7D0D0A0D0A2F2A20746F70202A2F0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D746F703A6265666F726520';
wwv_flow_api.g_varchar2_table(35) := '7B2020202020202F2A20626F72646572202A2F0D0A2020626F74746F6D3A202D3770783B0D0A2020626F726465722D626F74746F6D3A206E6F6E653B0D0A2020626F726465722D746F703A2037707820736F6C696420236432643264323B0D0A7D0D0A0D';
wwv_flow_api.g_varchar2_table(36) := '0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D746F703A6166746572207B202020202020202F2A2066696C6C206261636B67726F756E6420636F6C6F72202A2F0D0A2020626F74746F6D3A202D3670783B0D0A2020626F726465722D74';
wwv_flow_api.g_varchar2_table(37) := '6F703A2037707820736F6C696420236666663B0D0A2020626F726465722D626F74746F6D3A206E6F6E653B0D0A7D0D0A0D0A2F2A20626F74746F6D202A2F0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D626F74746F6D3A6265666F';
wwv_flow_api.g_varchar2_table(38) := '7265207B2020202F2A20626F72646572202A2F0D0A2020746F703A202D3770783B0D0A2020626F726465722D626F74746F6D3A2037707820736F6C696420236432643264323B0D0A2020626F726465722D746F703A206E6F6E653B0D0A7D0D0A2E707265';
wwv_flow_api.g_varchar2_table(39) := '746975732D2D746F6F6C7469702E6F70656E732D2D626F74746F6D3A6166746572207B202020202F2A2066696C6C206261636B67726F756E6420636F6C6F72202A2F0D0A2020746F703A202D3670783B0D0A2020626F726465722D626F74746F6D3A2037';
wwv_flow_api.g_varchar2_table(40) := '707820736F6C696420236666663B0D0A2020626F726465722D746F703A206E6F6E653B0D0A7D0D0A0D0A2F2A206C656674206D6964646C65202A2F0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D6C6566743A6265666F7265207B20';
wwv_flow_api.g_varchar2_table(41) := '202020202F2A20626F72646572202A2F0D0A202072696768743A202D313470783B0D0A2020626F726465722D6C6566743A2037707820736F6C696420236432643264323B0D0A7D0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D6C65';
wwv_flow_api.g_varchar2_table(42) := '66743A6166746572207B2020202020202F2A2066696C6C206261636B67726F756E6420636F6C6F72202A2F0D0A202072696768743A202D313370783B0D0A2020626F726465722D6C6566743A2037707820736F6C696420236666663B0D0A7D0D0A0D0A2F';
wwv_flow_api.g_varchar2_table(43) := '2A207269676874206D6964646C65202A2F0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D72696768743A6265666F7265207B202020202F2A20626F72646572202A2F0D0A20206C6566743A202D313470783B0D0A2020626F72646572';
wwv_flow_api.g_varchar2_table(44) := '2D72696768743A2037707820736F6C696420236432643264323B0D0A7D0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D72696768743A6166746572207B20202020202F2A2066696C6C206261636B67726F756E6420636F6C6F72202A';
wwv_flow_api.g_varchar2_table(45) := '2F0D0A20206C6566743A202D313370783B0D0A2020626F726465722D72696768743A2037707820736F6C696420236666663B0D0A7D2020202020200D0A0D0A2F2A206C656674206172726F7720746F70202A2F0D0A2E707265746975732D2D746F6F6C74';
wwv_flow_api.g_varchar2_table(46) := '69702E6F70656E732D2D6C6566742E6172726F772D746F703A6265666F7265207B20202020202F2A20626F72646572202A2F0D0A202072696768743A202D313570783B0D0A2020626F726465722D6C6566743A2038707820736F6C696420236432643264';
wwv_flow_api.g_varchar2_table(47) := '323B0D0A2020626F726465722D746F703A203070783B0D0A2020746F703A202D3170783B0D0A7D0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D6C6566742E6172726F772D746F703A6166746572207B2020202020202F2A2066696C';
wwv_flow_api.g_varchar2_table(48) := '6C206261636B67726F756E6420636F6C6F72202A2F0D0A202072696768743A202D313270783B0D0A2020626F726465722D6C6566743A2037707820736F6C696420236666663B0D0A2020626F726465722D746F703A203070783B0D0A2020746F703A2030';
wwv_flow_api.g_varchar2_table(49) := '70783B0D0A0D0A7D0D0A0D0A2F2A206C656674206172726F7720626F74746F6D202A2F0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D6C6566742E6172726F772D626F74746F6D3A6265666F7265207B20202020202F2A20626F7264';
wwv_flow_api.g_varchar2_table(50) := '6572202A2F0D0A202072696768743A202D313570783B0D0A2020626F726465722D6C6566743A2038707820736F6C696420236432643264323B0D0A2020626F726465722D626F74746F6D3A203070783B0D0A2020626F74746F6D3A202D302E3570783B0D';
wwv_flow_api.g_varchar2_table(51) := '0A2020746F703A206175746F3B0D0A2020746F703A20696E697469616C3B0D0A0D0A7D0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D6C6566742E6172726F772D626F74746F6D3A6166746572207B2020202020202F2A2066696C6C';
wwv_flow_api.g_varchar2_table(52) := '206261636B67726F756E6420636F6C6F72202A2F0D0A202072696768743A202D313270783B0D0A2020626F726465722D6C6566743A2037707820736F6C696420236666663B0D0A2020626F726465722D626F74746F6D3A203070783B0D0A2020626F7474';
wwv_flow_api.g_varchar2_table(53) := '6F6D3A203070783B0D0A2020746F703A206175746F3B0D0A2020746F703A20696E697469616C3B0D0A7D0D0A0D0A2F2A207269676874206172726F7720746F70202A2F0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D72696768742E';
wwv_flow_api.g_varchar2_table(54) := '6172726F772D746F703A6265666F7265207B20202020202F2A20626F72646572202A2F0D0A20206C6566743A202D313570783B0D0A2020626F726465722D72696768743A2038707820736F6C696420236432643264323B0D0A2020626F726465722D746F';
wwv_flow_api.g_varchar2_table(55) := '703A203070783B0D0A2020746F703A202D3170783B0D0A7D0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D72696768742E6172726F772D746F703A6166746572207B2020202020202F2A2066696C6C206261636B67726F756E642063';
wwv_flow_api.g_varchar2_table(56) := '6F6C6F72202A2F0D0A20206C6566743A202D313270783B0D0A2020626F726465722D72696768743A2037707820736F6C696420236666663B0D0A2020626F726465722D746F703A203070783B0D0A2020746F703A203070783B0D0A0D0A7D0D0A0D0A2F2A';
wwv_flow_api.g_varchar2_table(57) := '207269676874206172726F7720626F74746F6D202A2F0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D72696768742E6172726F772D626F74746F6D3A6265666F7265207B20202020202F2A20626F72646572202A2F0D0A20206C6566';
wwv_flow_api.g_varchar2_table(58) := '743A202D313570783B0D0A2020626F726465722D72696768743A2038707820736F6C696420236432643264323B0D0A2020626F726465722D626F74746F6D3A203070783B0D0A2020626F74746F6D3A202D302E3570783B0D0A2020746F703A206175746F';
wwv_flow_api.g_varchar2_table(59) := '3B0D0A2020746F703A20696E697469616C3B0D0A7D0D0A2E707265746975732D2D746F6F6C7469702E6F70656E732D2D72696768742E6172726F772D626F74746F6D3A6166746572207B2020202020202F2A2066696C6C206261636B67726F756E642063';
wwv_flow_api.g_varchar2_table(60) := '6F6C6F72202A2F0D0A20206C6566743A202D313270783B0D0A2020626F726465722D72696768743A2037707820736F6C696420236666663B0D0A2020626F726465722D626F74746F6D3A203070783B0D0A2020626F74746F6D3A203070783B0D0A202074';
wwv_flow_api.g_varchar2_table(61) := '6F703A206175746F3B0D0A2020746F703A20696E697469616C3B0D0A7D0D0A0D0A0D0A2E742D427574746F6E2D2D68656C70427574746F6E203E202E66612E707265746975734170657848656C706572207B0D0A2020666F6E742D73697A653A20313670';
wwv_flow_api.g_varchar2_table(62) := '783B0D0A20206C696E652D6865696768743A20313670783B0D0A202077696474683A20313670783B0D0A20206D61782D6865696768743A20313670783B0D0A20206F7061636974793A20302E37353B0D0A2020636F6C6F723A20726762612835362C2035';
wwv_flow_api.g_varchar2_table(63) := '362C2035362C20302E34293B0D0A20202F2A70616464696E673A203170782032707820317078203370783B0D0A2020636F6C6F723A20233338333833383B2A2F0D0A7D202020200D0A0D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(176938720652376512)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_file_name=>'pretius.apexhelper.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '66756E6374696F6E20707265746975735F6170657868656C7065725F696E697428207044612C207044614F7074696F6E7320297B0D0A2020766172200D0A202020206166666563746564456C656D656E74732C0D0A20202020656C656D2C0D0A20202020';
wwv_flow_api.g_varchar2_table(2) := '626F756E64456C656D657473203D2024286E756C6C293B0D0A0D0A20206966202820242E696E417272617928207044612E616374696F6E2E6166666563746564456C656D656E7473547970652C205B274A51554552595F53454C4543544F52272C274954';
wwv_flow_api.g_varchar2_table(3) := '454D275D2029203E202D312029207B0D0A202020206166666563746564456C656D656E7473203D2024287044612E6166666563746564456C656D656E7473293B0D0A20207D0D0A2020656C73652069662028207044612E616374696F6E2E616666656374';
wwv_flow_api.g_varchar2_table(4) := '6564456C656D656E747354797065203D3D2027524547494F4E272029207B0D0A202020206166666563746564456C656D656E7473203D2024287044612E6166666563746564456C656D656E7473292E66696E6428273A696E70757427293B0D0A20207D0D';
wwv_flow_api.g_varchar2_table(5) := '0A2020656C7365207B0D0A202020207468726F772022496E76616C6964206166666563746564456C656D656E747354797065203D20222B7044612E6174696F6E2E6166666563746564456C656D656E7473547970653B0D0A20207D0D0A0D0A2020666F72';
wwv_flow_api.g_varchar2_table(6) := '6D496E70757473203D206166666563746564456C656D656E74732E66696C7465722866756E6374696F6E28696E6465782C20656C656D297B200D0A2020202076617220656C656D203D202428656C656D293B0D0A2020202072657475726E20242E696E41';
wwv_flow_api.g_varchar2_table(7) := '7272617928656C656D2E70726F7028277461674E616D6527292C205B27494E505554272C20274649454C44534554272C202753454C454354272C20275445585441524541275D29203E202D3120262620656C656D2E697328273A76697369626C6527290D';
wwv_flow_api.g_varchar2_table(8) := '0A20207D293B0D0A0D0A2020666F726D496E707574732E656163682866756E6374696F6E28297B0D0A20202020766172200D0A20202020202073656C66203D20242874686973292C0D0A202020202020656C656D546F42696E643B0D0A0D0A2020202069';
wwv_flow_api.g_varchar2_table(9) := '6620282073656C662E697328273A726164696F2729207C7C2073656C662E697328273A636865636B626F782729207C7C2073656C662E6973282773656C6563745B636C6173732A3D73687574746C655D27292029207B0D0A202020202020656C656D546F';
wwv_flow_api.g_varchar2_table(10) := '42696E64203D2073656C662E636C6F7365737428276669656C6473657427293B0D0A202020207D200D0A20202020656C7365206966282073656C662E697328272E706F7075705F6C6F762729207C7C2073656C662E697328277465787461726561272920';
wwv_flow_api.g_varchar2_table(11) := '29207B0D0A202020202020656C656D546F42696E64203D2073656C662E636C6F7365737428276669656C6473657427293B0D0A202020207D0D0A20202020656C736520696620282073656C662E697328275B747970653D746578745D2729207C7C207365';
wwv_flow_api.g_varchar2_table(12) := '6C662E6973282773656C65637427292029207B0D0A202020202020656C656D546F42696E64203D2073656C663B0D0A202020207D0D0A20202020656C7365207B0D0A202020202020636F6E736F6C652E6C6F67282027556E7265636F676E697A65642074';
wwv_flow_api.g_varchar2_table(13) := '797065206F662041504558206974656D2E2043616E5C27742062696E642074686520706C7567696E2E2720293B0D0A202020202020636F6E736F6C652E6C6F67282073656C662E67657428302920293B0D0A202020207D0D0A0D0A202020206966202820';
wwv_flow_api.g_varchar2_table(14) := '656C656D546F42696E642E646174612827707265746975732D6170657868656C7065722729203D3D20756E646566696E65642029207B0D0A202020202020656C656D546F42696E642E6170657868656C70657228207044614F7074696F6E7320293B0D0A';
wwv_flow_api.g_varchar2_table(15) := '202020202020626F756E64456C656D657473203D20626F756E64456C656D6574732E6164642820656C656D546F42696E6420290D0A202020207D0D0A20202020656C7365207B0D0A2020202020202F2F616C726561647920626F756E642C20646F206E74';
wwv_flow_api.g_varchar2_table(16) := '680D0A202020207D0D0A0D0A20207D293B0D0A0D0A2020626F756E64456C656D6574732E6170657868656C70657228276F7074696F6E272C20276461496E70757473272C20626F756E64456C656D657473293B0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(350238593788251682)
,p_plugin_id=>wwv_flow_api.id(349810299976202281)
,p_file_name=>'pretius.apexhelper.init.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
