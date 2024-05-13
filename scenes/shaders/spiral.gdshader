shader_type canvas_item;

uniform vec2 resolution = vec2(160.0, 240.0);
uniform vec3 spiral_color: source_color = vec3(0.2, 0.6, 0.3);


float draw_spiral(vec2 uv, float rotation) {
	return 0.0;
}


void fragment() {
	vec2 uv = UV - 0.5; 
	uv.x = resolution.x / resolution.y;
	float spiral = draw_spiral(uv, 0.0);
	vec3 color = spiral * spiral_color;
}
