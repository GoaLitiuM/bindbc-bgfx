module bindbc.bgfx.dynload;

version(BindBgfx_Static)
{
	// these functions do nothing with statically-linked library

	@disable bool loadBgfx();
	@disable bool loadBgfx(const(char)* libName);
	@disable void unloadBgfx();
	@disable bool isBgfxLoaded();
}
else:

import bindbc.loader;
import bindbc.bgfx.funcs;

private SharedLib lib;

bool loadBgfx()
{
	version (Windows)
	{
		const(char)[][4] libNames =
		[
			"bgfx.dll",
			"bgfx-shared-libRelease.dll",
			"bgfx_debug.dll",
			"bgfx-shared-libDebug.dll"
		];
	}
	else version (OSX)
	{
		const(char)[][2] libNames =
		[
			"libbgfx-shared-libRelease.dylib",
			"libbgfx-shared-libDebug.dylib"
		];
	}
	else version (linux)
	{
		const(char)[][4] libNames =
		[
			"libbgfx-shared-libRelease.so",
			"libbgfx-shared-libDebug.so",
			"./libbgfx-shared-libRelease.so",
			"./libbgfx-shared-libDebug.so"
		];
	}
	else
		static assert(0, "bindbc-bgfx is not supported on this platform.");

	foreach (libName; libNames)
	{
		bool success = loadBgfx(libName.ptr);
		if (success)
			return success;
	}
	return false;
}

bool loadBgfx(const(char)* libName)
{
	lib = load(libName);
	if (lib == invalidHandle)
		return false;

	size_t errors = errorCount();

	lib.bindSymbol(cast(void**)&bgfx_attachment_init, "bgfx_attachment_init");
	lib.bindSymbol(cast(void**)&bgfx_vertex_layout_begin, "bgfx_vertex_layout_begin");
	lib.bindSymbol(cast(void**)&bgfx_vertex_layout_add, "bgfx_vertex_layout_add");
	lib.bindSymbol(cast(void**)&bgfx_vertex_layout_decode, "bgfx_vertex_layout_decode");
	lib.bindSymbol(cast(void**)&bgfx_vertex_layout_has, "bgfx_vertex_layout_has");
	lib.bindSymbol(cast(void**)&bgfx_vertex_layout_skip, "bgfx_vertex_layout_skip");
	lib.bindSymbol(cast(void**)&bgfx_vertex_layout_end, "bgfx_vertex_layout_end");
	lib.bindSymbol(cast(void**)&bgfx_vertex_pack, "bgfx_vertex_pack");
	lib.bindSymbol(cast(void**)&bgfx_vertex_unpack, "bgfx_vertex_unpack");
	lib.bindSymbol(cast(void**)&bgfx_vertex_convert, "bgfx_vertex_convert");
	lib.bindSymbol(cast(void**)&bgfx_weld_vertices, "bgfx_weld_vertices");
	lib.bindSymbol(cast(void**)&bgfx_topology_convert, "bgfx_topology_convert");
	lib.bindSymbol(cast(void**)&bgfx_topology_sort_tri_list, "bgfx_topology_sort_tri_list");
	lib.bindSymbol(cast(void**)&bgfx_get_supported_renderers, "bgfx_get_supported_renderers");
	lib.bindSymbol(cast(void**)&bgfx_get_renderer_name, "bgfx_get_renderer_name");
	lib.bindSymbol(cast(void**)&bgfx_init_ctor, "bgfx_init_ctor");
	lib.bindSymbol(cast(void**)&bgfx_init, "bgfx_init");
	lib.bindSymbol(cast(void**)&bgfx_shutdown, "bgfx_shutdown");
	lib.bindSymbol(cast(void**)&bgfx_reset, "bgfx_reset");
	lib.bindSymbol(cast(void**)&bgfx_frame, "bgfx_frame");
	lib.bindSymbol(cast(void**)&bgfx_get_renderer_type, "bgfx_get_renderer_type");
	lib.bindSymbol(cast(void**)&bgfx_get_caps, "bgfx_get_caps");
	lib.bindSymbol(cast(void**)&bgfx_get_stats, "bgfx_get_stats");
	lib.bindSymbol(cast(void**)&bgfx_alloc, "bgfx_alloc");
	lib.bindSymbol(cast(void**)&bgfx_copy, "bgfx_copy");
	lib.bindSymbol(cast(void**)&bgfx_make_ref, "bgfx_make_ref");
	lib.bindSymbol(cast(void**)&bgfx_make_ref_release, "bgfx_make_ref_release");
	lib.bindSymbol(cast(void**)&bgfx_set_debug, "bgfx_set_debug");
	lib.bindSymbol(cast(void**)&bgfx_dbg_text_clear, "bgfx_dbg_text_clear");
	lib.bindSymbol(cast(void**)&bgfx_dbg_text_printf, "bgfx_dbg_text_printf");
	lib.bindSymbol(cast(void**)&bgfx_dbg_text_vprintf, "bgfx_dbg_text_vprintf");
	lib.bindSymbol(cast(void**)&bgfx_dbg_text_image, "bgfx_dbg_text_image");
	lib.bindSymbol(cast(void**)&bgfx_create_index_buffer, "bgfx_create_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_index_buffer_name, "bgfx_set_index_buffer_name");
	lib.bindSymbol(cast(void**)&bgfx_destroy_index_buffer, "bgfx_destroy_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_create_vertex_layout, "bgfx_create_vertex_layout");
	lib.bindSymbol(cast(void**)&bgfx_destroy_vertex_layout, "bgfx_destroy_vertex_layout");
	lib.bindSymbol(cast(void**)&bgfx_create_vertex_buffer, "bgfx_create_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_vertex_buffer_name, "bgfx_set_vertex_buffer_name");
	lib.bindSymbol(cast(void**)&bgfx_destroy_vertex_buffer, "bgfx_destroy_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_create_dynamic_index_buffer, "bgfx_create_dynamic_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_create_dynamic_index_buffer_mem, "bgfx_create_dynamic_index_buffer_mem");
	lib.bindSymbol(cast(void**)&bgfx_update_dynamic_index_buffer, "bgfx_update_dynamic_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_destroy_dynamic_index_buffer, "bgfx_destroy_dynamic_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_create_dynamic_vertex_buffer, "bgfx_create_dynamic_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_create_dynamic_vertex_buffer_mem, "bgfx_create_dynamic_vertex_buffer_mem");
	lib.bindSymbol(cast(void**)&bgfx_update_dynamic_vertex_buffer, "bgfx_update_dynamic_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_destroy_dynamic_vertex_buffer, "bgfx_destroy_dynamic_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_get_avail_transient_index_buffer, "bgfx_get_avail_transient_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_get_avail_transient_vertex_buffer, "bgfx_get_avail_transient_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_get_avail_instance_data_buffer, "bgfx_get_avail_instance_data_buffer");
	lib.bindSymbol(cast(void**)&bgfx_alloc_transient_index_buffer, "bgfx_alloc_transient_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_alloc_transient_vertex_buffer, "bgfx_alloc_transient_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_alloc_transient_buffers, "bgfx_alloc_transient_buffers");
	lib.bindSymbol(cast(void**)&bgfx_alloc_instance_data_buffer, "bgfx_alloc_instance_data_buffer");
	lib.bindSymbol(cast(void**)&bgfx_create_indirect_buffer, "bgfx_create_indirect_buffer");
	lib.bindSymbol(cast(void**)&bgfx_destroy_indirect_buffer, "bgfx_destroy_indirect_buffer");
	lib.bindSymbol(cast(void**)&bgfx_create_shader, "bgfx_create_shader");
	lib.bindSymbol(cast(void**)&bgfx_get_shader_uniforms, "bgfx_get_shader_uniforms");
	lib.bindSymbol(cast(void**)&bgfx_set_shader_name, "bgfx_set_shader_name");
	lib.bindSymbol(cast(void**)&bgfx_destroy_shader, "bgfx_destroy_shader");
	lib.bindSymbol(cast(void**)&bgfx_create_program, "bgfx_create_program");
	lib.bindSymbol(cast(void**)&bgfx_create_compute_program, "bgfx_create_compute_program");
	lib.bindSymbol(cast(void**)&bgfx_destroy_program, "bgfx_destroy_program");
	lib.bindSymbol(cast(void**)&bgfx_is_texture_valid, "bgfx_is_texture_valid");
	lib.bindSymbol(cast(void**)&bgfx_calc_texture_size, "bgfx_calc_texture_size");
	lib.bindSymbol(cast(void**)&bgfx_create_texture, "bgfx_create_texture");
	lib.bindSymbol(cast(void**)&bgfx_create_texture_2d, "bgfx_create_texture_2d");
	lib.bindSymbol(cast(void**)&bgfx_create_texture_2d_scaled, "bgfx_create_texture_2d_scaled");
	lib.bindSymbol(cast(void**)&bgfx_create_texture_3d, "bgfx_create_texture_3d");
	lib.bindSymbol(cast(void**)&bgfx_create_texture_cube, "bgfx_create_texture_cube");
	lib.bindSymbol(cast(void**)&bgfx_update_texture_2d, "bgfx_update_texture_2d");
	lib.bindSymbol(cast(void**)&bgfx_update_texture_3d, "bgfx_update_texture_3d");
	lib.bindSymbol(cast(void**)&bgfx_update_texture_cube, "bgfx_update_texture_cube");
	lib.bindSymbol(cast(void**)&bgfx_read_texture, "bgfx_read_texture");
	lib.bindSymbol(cast(void**)&bgfx_set_texture_name, "bgfx_set_texture_name");
	lib.bindSymbol(cast(void**)&bgfx_get_direct_access_ptr, "bgfx_get_direct_access_ptr");
	lib.bindSymbol(cast(void**)&bgfx_destroy_texture, "bgfx_destroy_texture");
	lib.bindSymbol(cast(void**)&bgfx_create_frame_buffer, "bgfx_create_frame_buffer");
	lib.bindSymbol(cast(void**)&bgfx_create_frame_buffer_scaled, "bgfx_create_frame_buffer_scaled");
	lib.bindSymbol(cast(void**)&bgfx_create_frame_buffer_from_handles, "bgfx_create_frame_buffer_from_handles");
	lib.bindSymbol(cast(void**)&bgfx_create_frame_buffer_from_attachment, "bgfx_create_frame_buffer_from_attachment");
	lib.bindSymbol(cast(void**)&bgfx_create_frame_buffer_from_nwh, "bgfx_create_frame_buffer_from_nwh");
	lib.bindSymbol(cast(void**)&bgfx_set_frame_buffer_name, "bgfx_set_frame_buffer_name");
	lib.bindSymbol(cast(void**)&bgfx_get_texture, "bgfx_get_texture");
	lib.bindSymbol(cast(void**)&bgfx_destroy_frame_buffer, "bgfx_destroy_frame_buffer");
	lib.bindSymbol(cast(void**)&bgfx_create_uniform, "bgfx_create_uniform");
	lib.bindSymbol(cast(void**)&bgfx_get_uniform_info, "bgfx_get_uniform_info");
	lib.bindSymbol(cast(void**)&bgfx_destroy_uniform, "bgfx_destroy_uniform");
	lib.bindSymbol(cast(void**)&bgfx_create_occlusion_query, "bgfx_create_occlusion_query");
	lib.bindSymbol(cast(void**)&bgfx_get_result, "bgfx_get_result");
	lib.bindSymbol(cast(void**)&bgfx_destroy_occlusion_query, "bgfx_destroy_occlusion_query");
	lib.bindSymbol(cast(void**)&bgfx_set_palette_color, "bgfx_set_palette_color");
	lib.bindSymbol(cast(void**)&bgfx_set_palette_color_rgba8, "bgfx_set_palette_color_rgba8");
	lib.bindSymbol(cast(void**)&bgfx_set_view_name, "bgfx_set_view_name");
	lib.bindSymbol(cast(void**)&bgfx_set_view_rect, "bgfx_set_view_rect");
	lib.bindSymbol(cast(void**)&bgfx_set_view_rect_ratio, "bgfx_set_view_rect_ratio");
	lib.bindSymbol(cast(void**)&bgfx_set_view_scissor, "bgfx_set_view_scissor");
	lib.bindSymbol(cast(void**)&bgfx_set_view_clear, "bgfx_set_view_clear");
	lib.bindSymbol(cast(void**)&bgfx_set_view_clear_mrt, "bgfx_set_view_clear_mrt");
	lib.bindSymbol(cast(void**)&bgfx_set_view_mode, "bgfx_set_view_mode");
	lib.bindSymbol(cast(void**)&bgfx_set_view_frame_buffer, "bgfx_set_view_frame_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_view_transform, "bgfx_set_view_transform");
	lib.bindSymbol(cast(void**)&bgfx_set_view_order, "bgfx_set_view_order");
	lib.bindSymbol(cast(void**)&bgfx_encoder_begin, "bgfx_encoder_begin");
	lib.bindSymbol(cast(void**)&bgfx_encoder_end, "bgfx_encoder_end");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_marker, "bgfx_encoder_set_marker");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_state, "bgfx_encoder_set_state");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_condition, "bgfx_encoder_set_condition");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_stencil, "bgfx_encoder_set_stencil");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_scissor, "bgfx_encoder_set_scissor");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_scissor_cached, "bgfx_encoder_set_scissor_cached");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_transform, "bgfx_encoder_set_transform");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_transform_cached, "bgfx_encoder_set_transform_cached");
	lib.bindSymbol(cast(void**)&bgfx_encoder_alloc_transform, "bgfx_encoder_alloc_transform");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_uniform, "bgfx_encoder_set_uniform");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_index_buffer, "bgfx_encoder_set_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_dynamic_index_buffer, "bgfx_encoder_set_dynamic_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_transient_index_buffer, "bgfx_encoder_set_transient_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_vertex_buffer, "bgfx_encoder_set_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_dynamic_vertex_buffer, "bgfx_encoder_set_dynamic_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_transient_vertex_buffer, "bgfx_encoder_set_transient_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_vertex_count, "bgfx_encoder_set_vertex_count");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_instance_data_buffer, "bgfx_encoder_set_instance_data_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_instance_data_from_vertex_buffer, "bgfx_encoder_set_instance_data_from_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_instance_data_from_dynamic_vertex_buffer, "bgfx_encoder_set_instance_data_from_dynamic_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_instance_count, "bgfx_encoder_set_instance_count");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_texture, "bgfx_encoder_set_texture");
	lib.bindSymbol(cast(void**)&bgfx_encoder_touch, "bgfx_encoder_touch");
	lib.bindSymbol(cast(void**)&bgfx_encoder_submit, "bgfx_encoder_submit");
	lib.bindSymbol(cast(void**)&bgfx_encoder_submit_occlusion_query, "bgfx_encoder_submit_occlusion_query");
	lib.bindSymbol(cast(void**)&bgfx_encoder_submit_indirect, "bgfx_encoder_submit_indirect");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_compute_index_buffer, "bgfx_encoder_set_compute_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_compute_vertex_buffer, "bgfx_encoder_set_compute_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_compute_dynamic_index_buffer, "bgfx_encoder_set_compute_dynamic_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_compute_dynamic_vertex_buffer, "bgfx_encoder_set_compute_dynamic_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_compute_indirect_buffer, "bgfx_encoder_set_compute_indirect_buffer");
	lib.bindSymbol(cast(void**)&bgfx_encoder_set_image, "bgfx_encoder_set_image");
	lib.bindSymbol(cast(void**)&bgfx_encoder_dispatch, "bgfx_encoder_dispatch");
	lib.bindSymbol(cast(void**)&bgfx_encoder_dispatch_indirect, "bgfx_encoder_dispatch_indirect");
	lib.bindSymbol(cast(void**)&bgfx_encoder_discard, "bgfx_encoder_discard");
	lib.bindSymbol(cast(void**)&bgfx_encoder_blit, "bgfx_encoder_blit");
	lib.bindSymbol(cast(void**)&bgfx_request_screen_shot, "bgfx_request_screen_shot");
	lib.bindSymbol(cast(void**)&bgfx_render_frame, "bgfx_render_frame");
	lib.bindSymbol(cast(void**)&bgfx_set_platform_data, "bgfx_set_platform_data");
	lib.bindSymbol(cast(void**)&bgfx_get_internal_data, "bgfx_get_internal_data");
	lib.bindSymbol(cast(void**)&bgfx_override_internal_texture_ptr, "bgfx_override_internal_texture_ptr");
	lib.bindSymbol(cast(void**)&bgfx_override_internal_texture, "bgfx_override_internal_texture");
	lib.bindSymbol(cast(void**)&bgfx_set_marker, "bgfx_set_marker");
	lib.bindSymbol(cast(void**)&bgfx_set_state, "bgfx_set_state");
	lib.bindSymbol(cast(void**)&bgfx_set_condition, "bgfx_set_condition");
	lib.bindSymbol(cast(void**)&bgfx_set_stencil, "bgfx_set_stencil");
	lib.bindSymbol(cast(void**)&bgfx_set_scissor, "bgfx_set_scissor");
	lib.bindSymbol(cast(void**)&bgfx_set_scissor_cached, "bgfx_set_scissor_cached");
	lib.bindSymbol(cast(void**)&bgfx_set_transform, "bgfx_set_transform");
	lib.bindSymbol(cast(void**)&bgfx_set_transform_cached, "bgfx_set_transform_cached");
	lib.bindSymbol(cast(void**)&bgfx_alloc_transform, "bgfx_alloc_transform");
	lib.bindSymbol(cast(void**)&bgfx_set_uniform, "bgfx_set_uniform");
	lib.bindSymbol(cast(void**)&bgfx_set_index_buffer, "bgfx_set_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_dynamic_index_buffer, "bgfx_set_dynamic_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_transient_index_buffer, "bgfx_set_transient_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_vertex_buffer, "bgfx_set_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_dynamic_vertex_buffer, "bgfx_set_dynamic_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_transient_vertex_buffer, "bgfx_set_transient_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_vertex_count, "bgfx_set_vertex_count");
	lib.bindSymbol(cast(void**)&bgfx_set_instance_data_buffer, "bgfx_set_instance_data_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_instance_data_from_vertex_buffer, "bgfx_set_instance_data_from_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_instance_data_from_dynamic_vertex_buffer, "bgfx_set_instance_data_from_dynamic_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_instance_count, "bgfx_set_instance_count");
	lib.bindSymbol(cast(void**)&bgfx_set_texture, "bgfx_set_texture");
	lib.bindSymbol(cast(void**)&bgfx_touch, "bgfx_touch");
	lib.bindSymbol(cast(void**)&bgfx_submit, "bgfx_submit");
	lib.bindSymbol(cast(void**)&bgfx_submit_occlusion_query, "bgfx_submit_occlusion_query");
	lib.bindSymbol(cast(void**)&bgfx_submit_indirect, "bgfx_submit_indirect");
	lib.bindSymbol(cast(void**)&bgfx_set_compute_index_buffer, "bgfx_set_compute_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_compute_vertex_buffer, "bgfx_set_compute_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_compute_dynamic_index_buffer, "bgfx_set_compute_dynamic_index_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_compute_dynamic_vertex_buffer, "bgfx_set_compute_dynamic_vertex_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_compute_indirect_buffer, "bgfx_set_compute_indirect_buffer");
	lib.bindSymbol(cast(void**)&bgfx_set_image, "bgfx_set_image");
	lib.bindSymbol(cast(void**)&bgfx_dispatch, "bgfx_dispatch");
	lib.bindSymbol(cast(void**)&bgfx_dispatch_indirect, "bgfx_dispatch_indirect");
	lib.bindSymbol(cast(void**)&bgfx_discard, "bgfx_discard");
	lib.bindSymbol(cast(void**)&bgfx_blit, "bgfx_blit");
	lib.bindSymbol(cast(void**)&bgfx_get_interface, "bgfx_get_interface");

	return errors == errorCount();
}

void unloadBgfx()
{
	if(lib != invalidHandle)
		lib.unload();
}

bool isBgfxLoaded()
{
	return lib != invalidHandle;
}