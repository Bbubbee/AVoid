shader_type canvas_item;

uniform vec2 resolution = vec2(160.0, 240.0);
uniform vec3 spiral_color: source_color = vec3(0.0, 0.0, 0.0);
uniform float frequency: hint_range(1.0, 10.0, 0.1) = 8.0; 
uniform float speed: hint_range(1.0, 20.0, 0.1) = 8.0; 



float draw_spiral(vec2 uv, float rotation) {
	float uv_radius = length(uv);
	float uv_phi = atan(uv.y, uv.x) + rotation;
	float spiral_phi = (log(uv_radius) * frequency - uv_phi) / TAU;
	float spiral_radius = exp((TAU * floor(spiral_phi) + uv_phi) / frequency);
	return spiral_radius;
}


void fragment() {
	vec2 uv = UV - 0.5; 
	uv.x *= resolution.x / resolution.y;
	float spiral = draw_spiral(uv, TIME * speed);
	vec3 color = spiral * spiral_color;
	COLOR = vec4(color, 1.0);
}
