shader_type spatial;

uniform sampler2D camera1;
uniform sampler2D camera2;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 original1 = textureLod(camera1, SCREEN_UV, 0.0);
	vec4 original2 = textureLod(camera2, SCREEN_UV, 0.0);

	float radius = (1. + sin(TIME * 4.)) * .05 + 0.2;

	float circle = step(distance(SCREEN_UV, vec2(0.5)), radius);
	float circle_bounds = step(distance(SCREEN_UV, vec2(0.5)), radius + 0.01) - step(distance(SCREEN_UV, vec2(0.5)), radius);
	original1 *= circle;
	ALBEDO = (original1 + original2 + circle_bounds).rgb;
	ALPHA = min((original1 + original2).a, 1.);
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
