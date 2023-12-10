extends Control

class_name ThemeGeneratorSceneInterface

@export var theme_prefab_resource:ThemePrefabResource;

@onready var palette:Palette = theme_prefab_resource.palette
@onready var palette_from_coolors_code:String = theme_prefab_resource.palette_from_coolors_code
@onready var font:Font = theme_prefab_resource.font
@onready var default_font_size:int = theme_prefab_resource.default_font_size;
@onready var blend_borders:bool = theme_prefab_resource.blend_borders;
@onready var button_font_size_multiplier:float = theme_prefab_resource.button_font_size_multiplier;
@onready var font_outline_size:int = theme_prefab_resource.font_outline_size
@onready var sliders_width_px:int = theme_prefab_resource.sliders_width_px
@onready var scrollbars_width_px:int = theme_prefab_resource.scrollbars_width_px
@onready var flats_border_size_px:int = theme_prefab_resource.flats_border_size_px
@onready var flats_corner_radius_px:int = theme_prefab_resource.flats_corner_radius_px;
@onready var output_file_path:String = "res://addons/ThemeGenerator/Themes/DEFAULT.tres"

func _ready():
	if (palette_from_coolors_code):
		var data = JSON.parse_string(palette_from_coolors_code);
		palette = Palette.new();
		palette.color0 = data[0]
		palette.color1 = data[1];
		palette.color2 = data[2];
		palette.color3 = data[3];
		palette.color4 = data[4];
