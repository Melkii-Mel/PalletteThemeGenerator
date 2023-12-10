extends Resource

class_name ThemePrefabResource;

@export var palette:Palette;
@export_multiline var palette_from_coolors_code:String;
@export var font:Font;
@export var default_font_size:int = 100;
@export var blend_borders:bool = true;
@export var button_font_size_multiplier:float = 0.5;
@export var font_outline_size:int = 1;
@export var sliders_width_px:int = 40;
@export var scrollbars_width_px:int = 10;
@export var flats_border_size_px:int = 5;
@export var flats_corner_radius_px:int = 10;
@export var output_file_path:String = "res://addons/ThemeGenerator/Themes/DEFAULT.tres"
