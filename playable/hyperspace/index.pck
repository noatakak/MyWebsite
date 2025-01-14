GDPC                 �                                                                         P   res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn�      w2      �^o����ʀ^zeG�    T   res://.godot/exported/133200997/export-890e3b244d9eefc543d72c10e7f49fba-entering.scn        �      
v`�+=0�-��HE�    ,   res://.godot/global_script_class_cache.cfg  pZ             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�      &      A]/�no.^La_L�;       res://.godot/uid_cache.bin  �^      	      �H�������+�O�Sv�       res://entering.tscn.remap   pY      e       �EN�\UM��- �7        res://entering_hyper.gdshader   �      X      �N��fbĐ�!�n�	�       res://glow.gdshader  	      I      �̹E�r�� �Ro�       res://hyperspace.gdshader   p      ,      ]����#��o|_��N       res://icon.svg  �Z      �      �W|��/�\�pF[       res://icon.svg.import   �      �       ����Xg㾉���~       res://main.gd.remap PZ             ֤�\n�������Dݮ�       res://main.gdc  O            �����+�5�!2J{~       res://main.tscn.remap   �Y      a       �J�Sw� ������       res://project.binary�k      �      �I_^��eZ[!���Y       res://star_stretch.gdshader �R      W      du��+� W�+�����       res://starscape.gdshader@V      &      �}���W�9g�s sk)       res://white_fade.gdshader   0Q      �      r+�ڭ����o�Z-�            RSRC                    PackedScene            ��������                                            	      resource_local_to_scene    resource_name    shader    shader_parameter/speed     shader_parameter/stretch_factor    shader_parameter/star_color    shader_parameter/stretch_color    script 	   _bundled       Shader    res://entering_hyper.gdshader ��������      local://ShaderMaterial_18egu �         local://PackedScene_g3v2t B         ShaderMaterial                         �?        �?        �?  �?  �?  �?                �?  �?         PackedScene          	         names "   	      Control    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical 
   ColorRect 	   material    	   variants                        �?                            node_count             nodes     (   ��������        ����                                                          ����                                                       conn_count              conns               node_paths              editable_instances              version             RSRC    shader_type canvas_item;

uniform float speed : hint_range(0.0, 10.0) = 1.0;
uniform float stretch_factor : hint_range(0.0, 10.0) = 1.0;
uniform vec4 star_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 stretch_color : source_color = vec4(0.0, 0.0, 1.0, 1.0);

void fragment() {
    vec2 uv = FRAGCOORD.xy / SCREEN_PIXEL_SIZE.xy;
    vec2 center = vec2(0.5, 0.5);
    vec2 dir = uv - center;
    float dist = length(dir);

    // Generate starscape
    float star = fract(sin(dot(uv, vec2(12.9898, 78.233))) * 43758.5453);
    star = step(0.995, star); // Adjust this threshold to control star density

    // Stretch stars towards edges
    float stretch = smoothstep(0.0, 1.0, dist * stretch_factor - TIME * speed);
    vec4 color = mix(star_color, stretch_color, stretch);

    // Fade out stars as they leave the screen
    color.a *= smoothstep(1.0, 0.0, dist * stretch_factor - TIME * speed);

    COLOR = color * star;
}


//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
        shader_type spatial;

uniform vec4 glow_color : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform float glow_intensity : hint_range(0.0, 10.0) = 1.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
    vec3 base_color = vec3(0.0, 0.0, 0.0); // Base color of the sphere
    vec3 glow = glow_color.rgb * glow_intensity;
    ALBEDO = base_color + glow;
    EMISSION = glow;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
       shader_type spatial;

uniform sampler2D noise_texture;
uniform float vertical_scroll_speed : hint_range(0.0, 10.0) = 1.0;
uniform float horizontal_scroll_speed : hint_range(0.0, 10.0) = 1.0;
uniform float fade_to_white_amount : hint_range(0.0, 1.0) = 1.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV;
	float white_factor = min(uv.y, 0.4)/0.4;
	uv.y += TIME * vertical_scroll_speed;
	uv.x += TIME * horizontal_scroll_speed;
    vec4 color = texture(noise_texture, uv);
    vec3 final_color = mix(color.rgb, vec3(1.0), white_factor);
    ALBEDO = final_color*fade_to_white_amount;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
    GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�Hrm�n�Ts�#��� ��Ԁ������g��f�#I����2���w5 z���1��H�#Y���úW���9ȵm-k�|P�C	�<��m�Rܭ d�o���m$EJ�vw��ԶmO�f���23ØyIG��23s�����̐�-�?�#�om�VR����ĥၝ`!m<�  mcm@��Jb�M�t���6�$z��uS�70��`U$&�&g�]����xa{���c���~�*�~�
�� ��B���H��~�~�V�)�J�:̠Ʉ	rYlrs6E�M5�hB�C?Q��x0sT��IGK��پl9��]�Cڗ-�-����1ᇕ��HŦ�Mv�.�i�q�4N[���i������RRy�:[�q�q�Ti��B]x���M�kP�tY�&sڶt	u��݁z���Lф��P�PA���w���>�ʎ
0�ȹ�v�6���:������^�iL.cB؍1�I�w� ���c�Yy��Na�y�2+�9:���͏}����:�i���eX���s=S�ZL�<oJ��M�Z�JU�T�27�E��4����"k���&:�-��zK�ڭ:���Yn����EU�Tq�Sm�Jav"2Q܉�[ ��
}RP#����s,��}��g��lh�jcGJy��в�6�N�"�����+��Ģ�7n�a�j;|pW�f��E}�%�XA�N
�䑭���j��t���+���\��EH)�n��!:��^Pk�]�|��lT ��Z�4�729f�Ј)w��T0Ĕ�ix�\�b�9�<%�#Ɩs�Z�O�mjX �qZ0W����E�Y�ڨD!�$G�v����BJ�f|pq8��5�g�o��9�l�?���Q˝+U�	>�7�K��z�t����n�H�+��FbQ9���3g-UCv���-�n�*���E��A�҂
�Dʶ� ��WA�d�j��+�5�Ȓ���"���n�U��^�����$G��WX+\^�"�h.���M�3�e.
����MX�K,�Jfѕ*N�^�o2��:ՙ�#o�e.
��p�"<W22ENd�4B�V4x0=حZ�y����\^�J��dg��_4�oW�d�ĭ:Q��7c�ڡ��
A>��E�q�e-��2�=Ϲkh���*���jh�?4�QK��y@'�����zu;<-��|�����Y٠m|�+ۡII+^���L5j+�QK]����I �y��[�����(}�*>+���$��A3�EPg�K{��_;�v�K@���U��� gO��g��F� ���gW� �#J$��U~��-��u���������N�@���2@1��Vs���Ŷ`����Dd$R�":$ x��@�t���+D�}� \F�|��h��>�B�����B#�*6��  ��:���< ���=�P!���G@0��a��N�D�'hX�׀ "5#�l"j߸��n������w@ K�@A3�c s`\���J2�@#�_ 8�����I1�&��EN � 3T�����MEp9N�@�B���?ϓb�C��� � ��+�����N-s�M�  ��k���yA 7 �%@��&��c��� �4�{� � �����"(�ԗ�� �t�!"��TJN�2�O~� fB�R3?�������`��@�f!zD��%|��Z��ʈX��Ǐ�^�b��#5� }ى`�u�S6�F�"'U�JB/!5�>ԫ�������/��;	��O�!z����@�/�'�F�D"#��h�a �׆\-������ Xf  @ �q�`��鎊��M��T��(}�_�w�}���r�L|� |v�՘�e��yw�S|�� U�${1J'��[�ڞ�x��2����:��Ggjxؗ�m3�ivF��`�ߢe��a��G��V�t��is��J�����'�Q_5W���?�l�{1g���kԶ�zk�T�-|�V*��ޜZ�CW�,��(۝��Ǘ��� T{?�^��{���(9�(��u�5�͚����y~)J�&������}	@���74���&���N-�L_���o��������ݵ=�����y�VK��&�����������G�xߠ�]������ev%�{��eycc�{s�\�RАk{�|��P���eu�~]���2?0�F���1�V&x���:c������/�g{�.F)PDwGf�M�����(�0}��ag��e�'���6l�"s�L�H�c�"��̊ #Yf���:8������
�Eذ�3u�k5�Bt�m���!�#*Eǚa�ܰ_��Tq�.�0}�a@�^G��N�a��\��A�N�0���I���lq�5�+(��Џ�����Yq�wz_���*;<-w�;tX�"��n�'����Mۭy`0��kOԙ������,�����x�'��S�ݚa�텷�u��h����\��~�d.;����q5f-���������|�������ͪQl�9���~�\����7��^�?��������e�u$?`�߇u��*��yT����������A�6�E~`\�����n��1l�7t�;G�I��c��,VJ�Q[;�	Y|�kj��*�na����U�/�o��u�	?�闯7��׏w�m��.�|�~�}���r��RΎ��o.���o֜��~�_���.��ǿ�χ���q�˹���7�|�����~��[O5����2�%>�K�C�T׿�Y�L�%-	F�E�H,��v�t�f����i�V�N�'g��/)� ^.7��T��f��y�(����R��~f��p®��O���V�\���k���lڮ2aW��jc�{%�Y\m�šN�+����Y��׹H���y?��ۋG�~��b�l�9��dϻĸ��
��l�X��ɎZ�YDVD%*�P&��m�����]r�&��C����-2G-�-���d�gcgH��!�#�s^���s�l#/��l�r��#���8%Ӭ�L��1㬤ӖIYIa��0�qw���M�>�� � �����c��-$��D&����i�|L�n;�YˡR�����.�mK�P9_T� �c�����F*� ����+�\��|�Mt��nS�#��^+�l���2���|��9�Ç��9��X2mZPnߺ0P��������l�C�t'�^�A\�Q6�?Ɯ�_�EDVDDv�������vCcʁ&rw`w@�'c�%��6�_>0�m��i�}ܢ���            [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://woymvj1w3l3u"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 RSRC                    PackedScene            ��������                                            3     AnimationPlayer    CPUParticles3D    mesh    height    MeshInstance3D    visible    Control 	   material    shader_parameter/fade    resource_local_to_scene    resource_name    background_mode    background_color    background_energy_multiplier    background_intensity    background_canvas_max_layer    background_camera_feed_id    sky    sky_custom_fov    sky_rotation    ambient_light_source    ambient_light_color    ambient_light_sky_contribution    ambient_light_energy    reflected_light_source    tonemap_mode    tonemap_exposure    tonemap_white    ssr_enabled    ssr_max_steps    ssr_fade_in    ssr_fade_out    ssr_depth_tolerance    ssao_enabled    ssao_radius    ssao_intensity    ssao_power    ssao_detail    ssao_horizon    ssao_sharpness    ssao_light_affect    ssao_ao_channel_affect    ssil_enabled    ssil_radius    ssil_intensity    ssil_sharpness    ssil_normal_rejection    sdfgi_enabled    sdfgi_use_occlusion    sdfgi_read_sky_light    sdfgi_bounce_feedback    sdfgi_cascades    sdfgi_min_cell_size    sdfgi_cascade0_distance    sdfgi_max_distance    sdfgi_y_scale    sdfgi_energy    sdfgi_normal_bias    sdfgi_probe_bias    glow_enabled    glow_levels/1    glow_levels/2    glow_levels/3    glow_levels/4    glow_levels/5    glow_levels/6    glow_levels/7    glow_normalized    glow_intensity    glow_strength 	   glow_mix    glow_bloom    glow_blend_mode    glow_hdr_threshold    glow_hdr_scale    glow_hdr_luminance_cap    glow_map_strength 	   glow_map    fog_enabled 	   fog_mode    fog_light_color    fog_light_energy    fog_sun_scatter    fog_density    fog_aerial_perspective    fog_sky_affect    fog_height    fog_height_density    fog_depth_curve    fog_depth_begin    fog_depth_end    volumetric_fog_enabled    volumetric_fog_density    volumetric_fog_albedo    volumetric_fog_emission    volumetric_fog_emission_energy    volumetric_fog_gi_inject    volumetric_fog_anisotropy    volumetric_fog_length    volumetric_fog_detail_spread    volumetric_fog_ambient_inject    volumetric_fog_sky_affect -   volumetric_fog_temporal_reprojection_enabled ,   volumetric_fog_temporal_reprojection_amount    adjustment_enabled    adjustment_brightness    adjustment_contrast    adjustment_saturation    adjustment_color_correction    script    code    interpolation_mode    interpolation_color_space    offsets    colors    noise_type    seed 
   frequency    offset    fractal_type    fractal_octaves    fractal_lacunarity    fractal_gain    fractal_weighted_strength    fractal_ping_pong_strength    cellular_distance_function    cellular_jitter    cellular_return_type    domain_warp_enabled    domain_warp_type    domain_warp_amplitude    domain_warp_frequency    domain_warp_fractal_type    domain_warp_fractal_octaves    domain_warp_fractal_lacunarity    domain_warp_fractal_gain    width    invert    in_3d_space    generate_mipmaps 	   seamless    seamless_blend_skirt    as_normal_map    bump_strength 
   normalize    color_ramp    noise    render_priority 
   next_pass    shader '   shader_parameter/vertical_scroll_speed )   shader_parameter/horizontal_scroll_speed "   shader_parameter/final_brightness    shader_parameter/noise_texture    lightmap_size_hint    custom_aabb    flip_faces    add_uv2    uv2_padding    top_radius    bottom_radius    radial_segments    rings    cap_top    cap_bottom    transparency    blend_mode 
   cull_mode    depth_draw_mode    no_depth_test    shading_mode    diffuse_mode    specular_mode    disable_ambient_light    disable_fog    vertex_color_use_as_albedo    vertex_color_is_srgb    albedo_color    albedo_texture    albedo_texture_force_srgb    albedo_texture_msdf 	   metallic    metallic_specular    metallic_texture    metallic_texture_channel 
   roughness    roughness_texture    roughness_texture_channel    emission_enabled 	   emission    emission_energy_multiplier    emission_operator    emission_on_uv2    emission_texture    normal_enabled    normal_scale    normal_texture    rim_enabled    rim 	   rim_tint    rim_texture    clearcoat_enabled 
   clearcoat    clearcoat_roughness    clearcoat_texture    anisotropy_enabled    anisotropy    anisotropy_flowmap    ao_enabled    ao_light_affect    ao_texture 
   ao_on_uv2    ao_texture_channel    heightmap_enabled    heightmap_scale    heightmap_deep_parallax    heightmap_flip_tangent    heightmap_flip_binormal    heightmap_texture    heightmap_flip_texture    subsurf_scatter_enabled    subsurf_scatter_strength    subsurf_scatter_skin_mode    subsurf_scatter_texture &   subsurf_scatter_transmittance_enabled $   subsurf_scatter_transmittance_color &   subsurf_scatter_transmittance_texture $   subsurf_scatter_transmittance_depth $   subsurf_scatter_transmittance_boost    backlight_enabled 
   backlight    backlight_texture    refraction_enabled    refraction_scale    refraction_texture    refraction_texture_channel    detail_enabled    detail_mask    detail_blend_mode    detail_uv_layer    detail_albedo    detail_normal 
   uv1_scale    uv1_offset    uv1_triplanar    uv1_triplanar_sharpness    uv1_world_triplanar 
   uv2_scale    uv2_offset    uv2_triplanar    uv2_triplanar_sharpness    uv2_world_triplanar    texture_filter    texture_repeat    disable_receive_shadows    shadow_to_opacity    billboard_mode    billboard_keep_scale    grow    grow_amount    fixed_size    use_point_size    point_size    use_particle_trails    proximity_fade_enabled    proximity_fade_distance    msdf_pixel_range    msdf_outline_size    distance_fade_mode    distance_fade_min_distance    distance_fade_max_distance    length 
   loop_mode    step    capture_included    tracks/0/type    tracks/0/imported    tracks/0/enabled    tracks/0/path    tracks/0/interp    tracks/0/loop_wrap    tracks/0/keys    tracks/1/type    tracks/1/imported    tracks/1/enabled    tracks/1/path    tracks/1/interp    tracks/1/loop_wrap    tracks/1/keys    tracks/2/type    tracks/2/imported    tracks/2/enabled    tracks/2/path    tracks/2/interp    tracks/2/loop_wrap    tracks/2/keys    tracks/3/type    tracks/3/imported    tracks/3/enabled    tracks/3/path    tracks/3/interp    tracks/3/loop_wrap    tracks/3/keys    _data    radius    is_hemisphere 	   _bundled       Script    res://main.gd ��������   Shader    res://white_fade.gdshader ��������      local://Environment_71ku0 �         local://Shader_t255m �         local://Gradient_6ho85 .          local://FastNoiseLite_3n6iw �          local://NoiseTexture2D_dtqvx �          local://ShaderMaterial_1civ4 !         local://CylinderMesh_ilmf4 �!      !   local://StandardMaterial3D_jttte �!         local://CylinderMesh_n1jd4 o"         local://ShaderMaterial_4c7p2 �"         local://Animation_gf7cv �"         local://Animation_ve0n7 u&         local://AnimationLibrary_h4lni �*      !   local://StandardMaterial3D_jgagw +         local://SphereMesh_lxykg S+         local://PackedScene_j3p8r �+         Environment          �( A;         D         AE         ?G      
�#=H          m         Shader    n      %  shader_type spatial;

uniform sampler2D noise_texture;
uniform float vertical_scroll_speed : hint_range(0.0, 10.0) = 1.0;
uniform float horizontal_scroll_speed : hint_range(0.0, 10.0) = 1.0;
uniform float final_brightness : hint_range(0.0, 1.0) = 1.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV;
	float white_factor = min(uv.y, 0.4)/0.4;
	uv.y += TIME * vertical_scroll_speed;
	uv.x += TIME * horizontal_scroll_speed;
    vec4 color = texture(noise_texture, uv);
    vec3 final_color = mix(color.rgb, vec3(1.0), white_factor);
    ALBEDO = final_color*final_brightness;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
 m      	   Gradient    q   !          �(
?  �?r   $      .U6    l
P?  �?�>"��>  �?  �?4�9?4�9?4�9?  �?m         FastNoiseLite    u      N�<m         NoiseTexture2D    �         �            �            m         ShaderMaterial    �          �          �            �         ?�   )   �������?�        �?�            m         CylinderMesh                �         �         @�         @         Bm         StandardMaterial3D    �      �̌?�̌?�̌?  �?�        �?�          �         �      ��=?,T?  �?  �?�        �@m         CylinderMesh                �      ���=�      ���=      o�:m         ShaderMaterial    �                      m      
   Animation         o�:        value                                                                times !                transitions !        �?      values       )   ����MbP?      update                value                                                              times !                transitions !        �?      values                    update       !        value "         #        $             %        &        '              times !                transitions !        �?      values                   update       (        value )         *        +                ,        -        .              times !                transitions !        �?      values                    update        m      
   Animation    
         enter_hyperspace         @        value                                                                times !             @      transitions !        @@  @@      values       )   ����MbP?     HC      update                value                                                              times !          ػ�?   @� @G @      transitions !        �?  �?  �?  �?  �?      values                                              update       !        value "         #        $             %        &        '              times !          ػ�?   @      transitions !        �?  �?  �?      values                                update       (        value )         *        +                ,        -        .              times !            �?   @  @      transitions !        �?  �?  �?  �?      values                          �?             update        m         AnimationLibrary    /              RESET       
         enter_hyperspace          m         StandardMaterial3D    �                    �?m         SphereMesh                �         0       �B        HCm         PackedScene    2     	         names "   %      Node3D    script    animation_player    WorldEnvironment    environment 	   Camera3D    MeshInstance3D 
   transform    visible    mesh    CPUParticles3D    amount 	   lifetime    speed_scale    explosiveness    emission_shape    emission_ring_axis    emission_ring_height    emission_ring_radius    emission_ring_inner_radius    particle_flag_align_y 
   direction    spread    gravity    initial_velocity_min    initial_velocity_max    Control 	   material    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical 
   ColorRect    AnimationPlayer 
   libraries    MeshInstance3D2    	   variants                                          �?            1�;�  ��      �?1�;�          ��                     �?              �?              �?        �G��   p       D)   {�G�z�?     �?                            �?     �B     @@                               
�#<      	                                                    node_count             nodes     v   ��������        ����            @                     ����                           ����                      ����               	                  
   
   ����                        	      
   	                                                                                    !      ����                  
      
                            "   "   ����   #                     $   ����   	                conn_count              conns               node_paths              editable_instances              version       m      RSRC         GDSCd   �  (�/�`�� �:7@�2�P�������s�	e ����{�[ҏ���A6��c�K+k�&��$ / ) �H[����eeڮ��h�m����$����,
?������C�"�D�ck��I����j����k@~-D��~NJ���PI�-i�j��R��Mn��2�~Џ�s���_@����e?6�D#O"���҄�"�q��ɾ��
���U���ئf�2B֫�D}[`��Z����eĨ�i���� 'D-&JR�J��1 ����65b������#��'��9'L�'��(חNw��"X�	aL��~|V������(�Gs,�`��g�nEl_v���iΪ9��㰼�{}ӯ?h�[�
��Æ�?��l��=�
�h_u�7~�J�*W�w�Jb8�g0�6й��,���`2����-Q���Û��F��`Nv䫒��h�!�Ҏg�����g�%�u̽�:�t"=��            shader_type canvas_item;

uniform float fade : hint_range(0.0, 1.0);

void fragment() {
    vec2 uv = UV;
    vec2 center = vec2(0.5, 0.5);
    float dist = distance(uv, center);
    float alpha = 1.0 - smoothstep(0.0, fade, dist);
    COLOR.a *= alpha;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
       shader_type spatial;

uniform sampler2D noise_texture;
uniform float star_density : hint_range(0.0, 1.0) = 0.1;
uniform float star_size : hint_range(0.0, 1.0) = 0.01;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
    vec2 uv = FRAGCOORD.xy / VIEWPORT_SIZE;
    vec2 center = vec2(0.5, 0.5);
    float distance_from_center = distance(uv, center);

    float noise_value = texture(noise_texture, uv).r;
    float star = step(1.0 - star_density, noise_value);
    float size = smoothstep(star_size, star_size + 0.01, star);

    // Draw stars
    if (star > 0.0) {
        ALBEDO = vec3(size);
    } else {
        ALBEDO = vec3(0.0);
    }
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
         shader_type spatial;

uniform sampler2D noise_texture;
uniform float star_density : hint_range(0.0, 1.0) = 0.1;
uniform float stretch_threshold : hint_range(0.0, 1.0) = 0.5;


void fragment() {
    vec2 uv = UV;
    vec2 center = vec2(0.5, 0.5);
    float distance_from_center = distance(uv, center);

	 if (uv.y > stretch_threshold) {
        uv.y = uv.y * 1.5; // Adjust the stretch factor as needed
    }

    float noise_value = texture(noise_texture, uv).r;
    float star = step(1.0 - star_density, noise_value);

    // Draw stars
    if (star > 0.0) {
        ALBEDO = vec3(1.0);
    } else {
        ALBEDO = vec3(0.0);
    }
}



//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
          [remap]

path="res://.godot/exported/133200997/export-890e3b244d9eefc543d72c10e7f49fba-entering.scn"
           [remap]

path="res://.godot/exported/133200997/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
               [remap]

path="res://main.gdc"
 list=Array[Dictionary]([])
     <svg xmlns="http://www.w3.org/2000/svg" width="128" height="128"><rect width="124" height="124" x="2" y="2" fill="#363d52" stroke="#212532" stroke-width="4" rx="14"/><g fill="#fff" transform="translate(12.322 12.322)scale(.101)"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 814 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H446l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c0 34 58 34 58 0v-86c0-34-58-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042" transform="translate(12.322 12.322)scale(.101)"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></svg>              5   ����q�C4   res://assets/x-wing-cockpit/source/xwing_cockpit.fbxi��@��$6   res://assets/x-wing-cockpit/source/xwing_cockpit_0.png!��k:Q66   res://assets/x-wing-cockpit/source/xwing_cockpit_1.pngf�++ �>6   res://assets/x-wing-cockpit/source/xwing_cockpit_2.pngiG�J�6   res://assets/x-wing-cockpit/source/xwing_cockpit_3.png�>#e>S}r6   res://assets/x-wing-cockpit/source/xwing_cockpit_4.png�w�b/�.6   res://assets/x-wing-cockpit/source/xwing_cockpit_5.png�Y}1�C[6   res://assets/x-wing-cockpit/source/xwing_cockpit_6.pngTK9w>A6   res://assets/x-wing-cockpit/source/xwing_cockpit_7.png��C�f7�6   res://assets/x-wing-cockpit/source/xwing_cockpit_8.png�e���s|K6   res://assets/x-wing-cockpit/source/xwing_cockpit_9.png`GX<�p7   res://assets/x-wing-cockpit/source/xwing_cockpit_10.png��<�>r7   res://assets/x-wing-cockpit/source/xwing_cockpit_11.png|���H$7   res://assets/x-wing-cockpit/source/xwing_cockpit_12.png��"��C7   res://assets/x-wing-cockpit/source/xwing_cockpit_13.png�)s2��7   res://assets/x-wing-cockpit/source/xwing_cockpit_14.pngpY<��T�o7   res://assets/x-wing-cockpit/source/xwing_cockpit_15.png��!�H�D7   res://assets/x-wing-cockpit/source/xwing_cockpit_16.png�r����t7   res://assets/x-wing-cockpit/source/xwing_cockpit_17.png�p�P�@�d7   res://assets/x-wing-cockpit/source/xwing_cockpit_19.png?�[�wua7   res://assets/x-wing-cockpit/source/xwing_cockpit_20.pngN�b�{�<7   res://assets/x-wing-cockpit/source/xwing_cockpit_21.png�&�]31�<7   res://assets/x-wing-cockpit/source/xwing_cockpit_22.png�?�(B�7   res://assets/x-wing-cockpit/source/xwing_cockpit_23.png��K��45.   res://assets/x-wing-cockpit/textures/back.jpeg*����5   res://assets/x-wing-cockpit/textures/boxdetail02.jpegh���<��B5   res://assets/x-wing-cockpit/textures/boxdetail03.jpeg(�)8_-�O6   res://assets/x-wing-cockpit/textures/box_detail01.jpeg����;�&0   res://assets/x-wing-cockpit/textures/button.jpeg�,{5�F9   res://assets/x-wing-cockpit/textures/button_emission.jpeg�wӶ@��0   res://assets/x-wing-cockpit/textures/canopy.jpeg�v�yϤ�l5   res://assets/x-wing-cockpit/textures/canopy_back.jpeg���(yi1   res://assets/x-wing-cockpit/textures/cockpit.jpeg��GL���[8   res://assets/x-wing-cockpit/textures/cockpit_normal.jpegqW)r�o[81   res://assets/x-wing-cockpit/textures/console.jpeg�����v9   res://assets/x-wing-cockpit/textures/consoledetail01.jpeg*P]^�T�M8   res://assets/x-wing-cockpit/textures/console_normal.jpegz�3*�5N/   res://assets/x-wing-cockpit/textures/cover.jpeg_����:.   res://assets/x-wing-cockpit/textures/hull.jpeg�����!�5   res://assets/x-wing-cockpit/textures/hull_normal.jpegPX@���*.   res://assets/x-wing-cockpit/textures/knob.jpeg�2���y4   res://assets/x-wing-cockpit/textures/largelight.jpegϰmt�K-<   res://assets/x-wing-cockpit/textures/largelight_emision.jpeg���o%�":   res://assets/x-wing-cockpit/textures/largelight_normal.pngN�ӂ�7   res://assets/x-wing-cockpit/textures/metal_light 1.jpeg���?֍/   res://assets/x-wing-cockpit/textures/scope.jpeg�*0��Kw8   res://assets/x-wing-cockpit/textures/screen_diffuse.jpegT��o>/   res://assets/x-wing-cockpit/textures/window.pngZ�u0�(0   res://assets/x-wing-cockpit/textures/wire01.jpeg��1K��0   res://assets/x-wing-cockpit/textures/wire02.jpeg�ʉb���d   res://entering.tscn��%���   res://icon.svg���R$E   res://main.tscn       ECFG      application/config/name         New Game Project   application/run/main_scene         res://main.tscn    application/config/features$   "         4.3    Forward Plus       application/config/icon         res://icon.svg     input/space�              events              InputEventKey         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          pressed           keycode           physical_keycode       	   key_label             unicode           location          echo          script            deadzone      ?   input/click�              events              InputEventMouseButton         resource_local_to_scene           resource_name             device     ����	   window_id             alt_pressed           shift_pressed             ctrl_pressed          meta_pressed          button_mask          position     �B  �A   global_position      C  �B   factor       �?   button_index         canceled          pressed          double_click          script            deadzone      ?   