extends Node

@export var interface:ThemeGeneratorSceneInterface;
@export var rects:Array[Control];
@export var button:Button;

var palette:Palette;

func _ready():
	await get_tree().create_timer(0).timeout;
	palette = interface.palette;
	rects[0].modulate = palette.color0;
	rects[1].modulate = palette.color1;
	rects[2].modulate = palette.color2;
	rects[3].modulate = palette.color3;
	rects[4].modulate = palette.color4;
	button.connect("pressed", generate_theme);

func generate_theme():
	var colors:Array[Color] = []
	for rect in rects:
		colors.append(rect.modulate);
	
	var style_box:StyleBoxFlat = StyleBoxFlat.new();
	style_box.set_border_width_all(interface.flats_border_size_px);
	style_box.border_blend = true;
	style_box.set_corner_radius_all(interface.flats_corner_radius_px)
	
	var theme:Theme = Theme.new();
	theme.default_font = interface.font;
	theme.default_font_size = interface.default_font_size;
	
	
	var style_box_darkest:StyleBoxFlat = style_box.duplicate();
	style_box_darkest.bg_color = colors[0];
	style_box_darkest.border_color = colors[1];
	
	theme.add_type("Panel")
	theme.set_stylebox("panel", "Panel", style_box_darkest);
	
	var style_box_brighter:StyleBoxFlat = style_box.duplicate();
	style_box_brighter.bg_color = colors[1];
	style_box_brighter.border_color = colors[2];
	
	var style_box_brightest:StyleBoxFlat = style_box.duplicate();
	style_box_brightest.bg_color = colors[2];
	style_box_brightest.border_color = colors[1];
	
	var style_box_brighter_disabled:StyleBoxFlat = style_box_brighter.duplicate();
	style_box_brighter_disabled.bg_color *= 0.1;
	style_box_brighter_disabled.bg_color.a = 1;
	var style_box_brighter_hover:StyleBoxFlat = style_box_brighter.duplicate();
	style_box_brighter_hover.bg_color *= 0.8;
	style_box_brighter_hover.bg_color.a = 1;
	var style_box_brighter_pressed:StyleBoxFlat = style_box_brighter.duplicate();
	style_box_brighter_pressed.bg_color *= 0.6;
	style_box_brighter_pressed.bg_color.a = 1;
	
	theme.add_type("Button");
	theme.set_stylebox("disabled", "Button", style_box_brighter_disabled);
	theme.set_stylebox("pressed", "Button", style_box_brighter_pressed);
	theme.set_stylebox("focus", "Button", StyleBoxEmpty.new());
	theme.set_stylebox("hover", "Button", style_box_brighter_hover);
	theme.set_stylebox("normal", "Button", style_box_brighter);
	
	
	theme.add_type("LineEdit")
	theme.set_stylebox("focus", "LineEdit", StyleBoxEmpty.new())
	theme.set_stylebox("normal", "LineEdit", style_box_brighter_hover);
	theme.set_stylebox("read_only", "LineEdit", style_box_brighter_pressed);
	
	theme.add_type("TextEdit")
	theme.set_stylebox("focus", "TextEdit", StyleBoxEmpty.new())
	theme.set_stylebox("normal", "TextEdit", style_box_brighter_hover);
	theme.set_stylebox("read_only", "TextEdit", style_box_brighter_pressed);
	
	var empty_placeholder:PlaceholderTexture2D = PlaceholderTexture2D.new()
	empty_placeholder.size = Vector2.ZERO;
	
	var style_box_hslider_slider:StyleBoxFlat = style_box_brighter.duplicate();
	style_box_hslider_slider.expand_margin_top = interface.sliders_width_px / 2;
	style_box_hslider_slider.expand_margin_bottom = interface.sliders_width_px / 2;
	var style_box_hslider_grabber_area:StyleBoxFlat = style_box_hslider_slider.duplicate();
	var style_box_hslider_grabber_area_highlight:StyleBoxFlat = style_box_hslider_slider.duplicate();
	style_box_hslider_slider.bg_color = colors[0]
	style_box_hslider_slider.border_color = colors[1]
	style_box_hslider_grabber_area.bg_color = colors[1]
	style_box_hslider_grabber_area.border_color = colors[0]
	style_box_hslider_grabber_area_highlight.bg_color = colors[1]
	style_box_hslider_grabber_area_highlight.border_color = colors[0]
	style_box_hslider_grabber_area.border_color *= 0.6;
	style_box_hslider_grabber_area.border_color.a = 1;
	style_box_hslider_grabber_area_highlight.border_color *= 0.8;
	style_box_hslider_grabber_area_highlight.border_color.a = 1;
	theme.add_type("HSlider");
	theme.set_icon("grabber", "HSlider", empty_placeholder)
	theme.set_icon("grabber_disabled", "HSlider", empty_placeholder)
	theme.set_icon("grabber_highlight", "HSlider", empty_placeholder)
	theme.set_constant("center_grabber", "HSlider", -1);
	theme.set_stylebox("grabber_area", "HSlider", style_box_hslider_grabber_area)
	theme.set_stylebox("grabber_area_highlight", "HSlider", style_box_hslider_grabber_area_highlight)
	theme.set_stylebox("slider", "HSlider", style_box_hslider_slider)
	
	var style_box_vslider_slider:StyleBoxFlat = style_box_brighter.duplicate();
	style_box_vslider_slider.expand_margin_left = interface.sliders_width_px / 2;
	style_box_vslider_slider.expand_margin_right = interface.sliders_width_px / 2;
	var style_box_vslider_grabber_area:StyleBoxFlat = style_box_vslider_slider.duplicate();
	var style_box_vslider_grabber_area_highlight:StyleBoxFlat = style_box_vslider_slider.duplicate();
	
	style_box_vslider_slider.bg_color = colors[0]
	style_box_vslider_slider.border_color = colors[1]
	style_box_vslider_grabber_area.bg_color = colors[1]
	style_box_vslider_grabber_area.border_color = colors[0]
	style_box_vslider_grabber_area_highlight.bg_color = colors[1]
	style_box_vslider_grabber_area_highlight.border_color = colors[0]
	
	style_box_vslider_grabber_area.border_color *= 0.6;
	style_box_vslider_grabber_area.border_color.a = 1;
	style_box_vslider_grabber_area_highlight.border_color *= 0.8;
	style_box_vslider_grabber_area_highlight.border_color.a = 1;
	theme.add_type("VSlider");
	theme.set_icon("grabber", "VSlider", empty_placeholder)
	theme.set_icon("grabber_disabled", "VSlider", empty_placeholder)
	theme.set_icon("grabber_highlight", "VSlider", empty_placeholder)
	theme.set_constant("center_grabber", "VSlider", -1);
	theme.set_stylebox("grabber_area", "VSlider", style_box_vslider_grabber_area)
	theme.set_stylebox("grabber_area_highlight", "VSlider", style_box_vslider_grabber_area_highlight)
	theme.set_stylebox("slider", "VSlider", style_box_vslider_slider)
	
	var style_box_vscroll_bar_grabber:StyleBoxFlat = style_box_vslider_grabber_area.duplicate();
	style_box_vscroll_bar_grabber.expand_margin_left = 0;
	style_box_vscroll_bar_grabber.expand_margin_right = 0;
	var style_box_vscroll_bar_grabber_highlight = style_box_vscroll_bar_grabber.duplicate();
	style_box_vscroll_bar_grabber_highlight.border_color *= 0.8;
	style_box_vscroll_bar_grabber_highlight.border_color.a = 1;
	var style_box_vscroll_bar_slider = style_box_vslider_slider.duplicate();
	style_box_vscroll_bar_slider.expand_margin_left = 0;
	style_box_vscroll_bar_slider.expand_margin_right = 0;
	
	var style_box_hscroll_bar_grabber = style_box_vscroll_bar_grabber.duplicate();
	style_box_hscroll_bar_grabber.expand_margin_left = 0
	style_box_hscroll_bar_grabber.expand_margin_right = 0
	style_box_hscroll_bar_grabber.expand_margin_top = 0;
	style_box_hscroll_bar_grabber.expand_margin_bottom = 0;
	var style_box_hscroll_bar_grabber_highlight = style_box_vscroll_bar_grabber.duplicate();
	style_box_hscroll_bar_grabber_highlight.border_color *= 0.8;
	style_box_hscroll_bar_grabber_highlight.border_color.a = 1;
	var style_box_hscroll_bar_slider = style_box_hslider_slider.duplicate();
	style_box_hscroll_bar_slider.expand_margin_top = 0;
	style_box_hscroll_bar_slider.expand_margin_bottom = 0;
	
	theme.add_type("VScrollBar");
	theme.set_stylebox("grabber", "VScrollBar", style_box_vscroll_bar_grabber)
	theme.set_stylebox("grabber_highlight", "VScrollBar", style_box_vscroll_bar_grabber_highlight);
	theme.set_stylebox("grabber_pressed", "VScrollBar", style_box_vscroll_bar_grabber_highlight);
	theme.set_stylebox("scroll", "VScrollBar", style_box_vscroll_bar_slider);
	theme.add_type("HScrollBar");
	theme.set_stylebox("grabber", "HScrollBar", style_box_hscroll_bar_grabber)
	theme.set_stylebox("grabber_highlight", "HScrollBar", style_box_hscroll_bar_grabber_highlight);
	theme.set_stylebox("grabber_pressed", "HScrollBar", style_box_hscroll_bar_grabber_highlight);
	theme.set_stylebox("scroll", "HScrollBar", style_box_hscroll_bar_slider);
	
	theme.add_type("Label")
	theme.add_type("RichTextLabel")
	theme.set_color("font_color", "Button", colors[3]);
	theme.set_color("font_focus_color", "Button", colors[3]);
	theme.set_color("font_hover_color", "Button", colors[3]);
	theme.set_color("font_hover_pressed_color", "Button", colors[3]);
	theme.set_color("font_pressed_color", "Button", colors[3]);
	theme.set_color("font_color", "Label", colors[3]);
	theme.set_color("default_color", "RichTextLabel", colors[3]);
	theme.set_color("font_outline_color", "Label", colors[4])
	theme.set_color("font_outline_color", "RichTextLabel", colors[4])
	theme.set_color("font_outline_color", "Button", colors[4])
	theme.set_constant("outline_size", "Label", interface.font_outline_size)
	theme.set_constant("outline_size", "Button", interface.font_outline_size)
	theme.set_constant("outline_size", "RichTextLabel", interface.font_outline_size)
	
	ResourceSaver.save(theme, interface.output_file_path);
