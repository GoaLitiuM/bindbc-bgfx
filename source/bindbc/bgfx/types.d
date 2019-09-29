module bindbc.bgfx.types;

public import core.stdc.stdarg : va_list;

alias uint8_t = ubyte;
alias uint16_t = ushort;
alias uint32_t = uint;
alias uint64_t = ulong;
alias int8_t = byte;
alias int16_t = short;
alias int32_t = int;
alias int64_t = long;
alias uintptr_t = ulong;

extern(C) @nogc nothrow:

enum bgfx_fatal_t
{
	BGFX_FATAL_DEBUG_CHECK,
	BGFX_FATAL_INVALID_SHADER,
	BGFX_FATAL_UNABLE_TO_INITIALIZE,
	BGFX_FATAL_UNABLE_TO_CREATE_TEXTURE,
	BGFX_FATAL_DEVICE_LOST,

	BGFX_FATAL_COUNT
}

enum bgfx_renderer_type_t
{
	BGFX_RENDERER_TYPE_NOOP,
	BGFX_RENDERER_TYPE_DIRECT3D9,
	BGFX_RENDERER_TYPE_DIRECT3D11,
	BGFX_RENDERER_TYPE_DIRECT3D12,
	BGFX_RENDERER_TYPE_GNM,
	BGFX_RENDERER_TYPE_METAL,
	BGFX_RENDERER_TYPE_NVN,
	BGFX_RENDERER_TYPE_OPENGLES,
	BGFX_RENDERER_TYPE_OPENGL,
	BGFX_RENDERER_TYPE_VULKAN,

	BGFX_RENDERER_TYPE_COUNT
}

enum bgfx_access_t
{
	BGFX_ACCESS_READ,
	BGFX_ACCESS_WRITE,
	BGFX_ACCESS_READWRITE,

	BGFX_ACCESS_COUNT
}

enum bgfx_attrib_t
{
	BGFX_ATTRIB_POSITION,
	BGFX_ATTRIB_NORMAL,
	BGFX_ATTRIB_TANGENT,
	BGFX_ATTRIB_BITANGENT,
	BGFX_ATTRIB_COLOR0,
	BGFX_ATTRIB_COLOR1,
	BGFX_ATTRIB_COLOR2,
	BGFX_ATTRIB_COLOR3,
	BGFX_ATTRIB_INDICES,
	BGFX_ATTRIB_WEIGHT,
	BGFX_ATTRIB_TEXCOORD0,
	BGFX_ATTRIB_TEXCOORD1,
	BGFX_ATTRIB_TEXCOORD2,
	BGFX_ATTRIB_TEXCOORD3,
	BGFX_ATTRIB_TEXCOORD4,
	BGFX_ATTRIB_TEXCOORD5,
	BGFX_ATTRIB_TEXCOORD6,
	BGFX_ATTRIB_TEXCOORD7,

	BGFX_ATTRIB_COUNT
}

enum bgfx_attrib_type_t
{
	BGFX_ATTRIB_TYPE_UINT8,
	BGFX_ATTRIB_TYPE_UINT10,
	BGFX_ATTRIB_TYPE_INT16,
	BGFX_ATTRIB_TYPE_HALF,
	BGFX_ATTRIB_TYPE_FLOAT,

	BGFX_ATTRIB_TYPE_COUNT
}

enum bgfx_texture_format_t
{
	BGFX_TEXTURE_FORMAT_BC1,
	BGFX_TEXTURE_FORMAT_BC2,
	BGFX_TEXTURE_FORMAT_BC3,
	BGFX_TEXTURE_FORMAT_BC4,
	BGFX_TEXTURE_FORMAT_BC5,
	BGFX_TEXTURE_FORMAT_BC6H,
	BGFX_TEXTURE_FORMAT_BC7,
	BGFX_TEXTURE_FORMAT_ETC1,
	BGFX_TEXTURE_FORMAT_ETC2,
	BGFX_TEXTURE_FORMAT_ETC2A,
	BGFX_TEXTURE_FORMAT_ETC2A1,
	BGFX_TEXTURE_FORMAT_PTC12,
	BGFX_TEXTURE_FORMAT_PTC14,
	BGFX_TEXTURE_FORMAT_PTC12A,
	BGFX_TEXTURE_FORMAT_PTC14A,
	BGFX_TEXTURE_FORMAT_PTC22,
	BGFX_TEXTURE_FORMAT_PTC24,
	BGFX_TEXTURE_FORMAT_ATC,
	BGFX_TEXTURE_FORMAT_ATCE,
	BGFX_TEXTURE_FORMAT_ATCI,
	BGFX_TEXTURE_FORMAT_ASTC4X4,
	BGFX_TEXTURE_FORMAT_ASTC5X5,
	BGFX_TEXTURE_FORMAT_ASTC6X6,
	BGFX_TEXTURE_FORMAT_ASTC8X5,
	BGFX_TEXTURE_FORMAT_ASTC8X6,
	BGFX_TEXTURE_FORMAT_ASTC10X5,
	BGFX_TEXTURE_FORMAT_UNKNOWN,
	BGFX_TEXTURE_FORMAT_R1,
	BGFX_TEXTURE_FORMAT_A8,
	BGFX_TEXTURE_FORMAT_R8,
	BGFX_TEXTURE_FORMAT_R8I,
	BGFX_TEXTURE_FORMAT_R8U,
	BGFX_TEXTURE_FORMAT_R8S,
	BGFX_TEXTURE_FORMAT_R16,
	BGFX_TEXTURE_FORMAT_R16I,
	BGFX_TEXTURE_FORMAT_R16U,
	BGFX_TEXTURE_FORMAT_R16F,
	BGFX_TEXTURE_FORMAT_R16S,
	BGFX_TEXTURE_FORMAT_R32I,
	BGFX_TEXTURE_FORMAT_R32U,
	BGFX_TEXTURE_FORMAT_R32F,
	BGFX_TEXTURE_FORMAT_RG8,
	BGFX_TEXTURE_FORMAT_RG8I,
	BGFX_TEXTURE_FORMAT_RG8U,
	BGFX_TEXTURE_FORMAT_RG8S,
	BGFX_TEXTURE_FORMAT_RG16,
	BGFX_TEXTURE_FORMAT_RG16I,
	BGFX_TEXTURE_FORMAT_RG16U,
	BGFX_TEXTURE_FORMAT_RG16F,
	BGFX_TEXTURE_FORMAT_RG16S,
	BGFX_TEXTURE_FORMAT_RG32I,
	BGFX_TEXTURE_FORMAT_RG32U,
	BGFX_TEXTURE_FORMAT_RG32F,
	BGFX_TEXTURE_FORMAT_RGB8,
	BGFX_TEXTURE_FORMAT_RGB8I,
	BGFX_TEXTURE_FORMAT_RGB8U,
	BGFX_TEXTURE_FORMAT_RGB8S,
	BGFX_TEXTURE_FORMAT_RGB9E5F,
	BGFX_TEXTURE_FORMAT_BGRA8,
	BGFX_TEXTURE_FORMAT_RGBA8,
	BGFX_TEXTURE_FORMAT_RGBA8I,
	BGFX_TEXTURE_FORMAT_RGBA8U,
	BGFX_TEXTURE_FORMAT_RGBA8S,
	BGFX_TEXTURE_FORMAT_RGBA16,
	BGFX_TEXTURE_FORMAT_RGBA16I,
	BGFX_TEXTURE_FORMAT_RGBA16U,
	BGFX_TEXTURE_FORMAT_RGBA16F,
	BGFX_TEXTURE_FORMAT_RGBA16S,
	BGFX_TEXTURE_FORMAT_RGBA32I,
	BGFX_TEXTURE_FORMAT_RGBA32U,
	BGFX_TEXTURE_FORMAT_RGBA32F,
	BGFX_TEXTURE_FORMAT_R5G6B5,
	BGFX_TEXTURE_FORMAT_RGBA4,
	BGFX_TEXTURE_FORMAT_RGB5A1,
	BGFX_TEXTURE_FORMAT_RGB10A2,
	BGFX_TEXTURE_FORMAT_RG11B10F,
	BGFX_TEXTURE_FORMAT_UNKNOWNDEPTH,
	BGFX_TEXTURE_FORMAT_D16,
	BGFX_TEXTURE_FORMAT_D24,
	BGFX_TEXTURE_FORMAT_D24S8,
	BGFX_TEXTURE_FORMAT_D32,
	BGFX_TEXTURE_FORMAT_D16F,
	BGFX_TEXTURE_FORMAT_D24F,
	BGFX_TEXTURE_FORMAT_D32F,
	BGFX_TEXTURE_FORMAT_D0S8,

	BGFX_TEXTURE_FORMAT_COUNT
}

enum bgfx_uniform_type_t
{
	BGFX_UNIFORM_TYPE_SAMPLER,
	BGFX_UNIFORM_TYPE_END,
	BGFX_UNIFORM_TYPE_VEC4,
	BGFX_UNIFORM_TYPE_MAT3,
	BGFX_UNIFORM_TYPE_MAT4,

	BGFX_UNIFORM_TYPE_COUNT
}

enum bgfx_backbuffer_ratio_t
{
	BGFX_BACKBUFFER_RATIO_EQUAL,
	BGFX_BACKBUFFER_RATIO_HALF,
	BGFX_BACKBUFFER_RATIO_QUARTER,
	BGFX_BACKBUFFER_RATIO_EIGHTH,
	BGFX_BACKBUFFER_RATIO_SIXTEENTH,
	BGFX_BACKBUFFER_RATIO_DOUBLE,

	BGFX_BACKBUFFER_RATIO_COUNT
}

enum bgfx_occlusion_query_result_t
{
	BGFX_OCCLUSION_QUERY_RESULT_INVISIBLE,
	BGFX_OCCLUSION_QUERY_RESULT_VISIBLE,
	BGFX_OCCLUSION_QUERY_RESULT_NORESULT,

	BGFX_OCCLUSION_QUERY_RESULT_COUNT
}

enum bgfx_topology_t
{
	BGFX_TOPOLOGY_TRI_LIST,
	BGFX_TOPOLOGY_TRI_STRIP,
	BGFX_TOPOLOGY_LINE_LIST,
	BGFX_TOPOLOGY_LINE_STRIP,
	BGFX_TOPOLOGY_POINT_LIST,

	BGFX_TOPOLOGY_COUNT
}

enum bgfx_topology_convert_t
{
	BGFX_TOPOLOGY_CONVERT_TRI_LIST_FLIP_WINDING,
	BGFX_TOPOLOGY_CONVERT_TRI_STRIP_FLIP_WINDING,
	BGFX_TOPOLOGY_CONVERT_TRI_LIST_TO_LINE_LIST,
	BGFX_TOPOLOGY_CONVERT_TRI_STRIP_TO_TRI_LIST,
	BGFX_TOPOLOGY_CONVERT_LINE_STRIP_TO_LINE_LIST,

	BGFX_TOPOLOGY_CONVERT_COUNT
}

enum bgfx_topology_sort_t
{
	BGFX_TOPOLOGY_SORT_DIRECTION_FRONT_TO_BACK_MIN,
	BGFX_TOPOLOGY_SORT_DIRECTION_FRONT_TO_BACK_AVG,
	BGFX_TOPOLOGY_SORT_DIRECTION_FRONT_TO_BACK_MAX,
	BGFX_TOPOLOGY_SORT_DIRECTION_BACK_TO_FRONT_MIN,
	BGFX_TOPOLOGY_SORT_DIRECTION_BACK_TO_FRONT_AVG,
	BGFX_TOPOLOGY_SORT_DIRECTION_BACK_TO_FRONT_MAX,
	BGFX_TOPOLOGY_SORT_DISTANCE_FRONT_TO_BACK_MIN,
	BGFX_TOPOLOGY_SORT_DISTANCE_FRONT_TO_BACK_AVG,
	BGFX_TOPOLOGY_SORT_DISTANCE_FRONT_TO_BACK_MAX,
	BGFX_TOPOLOGY_SORT_DISTANCE_BACK_TO_FRONT_MIN,
	BGFX_TOPOLOGY_SORT_DISTANCE_BACK_TO_FRONT_AVG,
	BGFX_TOPOLOGY_SORT_DISTANCE_BACK_TO_FRONT_MAX,

	BGFX_TOPOLOGY_SORT_COUNT
}

enum bgfx_view_mode_t
{
	BGFX_VIEW_MODE_DEFAULT,
	BGFX_VIEW_MODE_SEQUENTIAL,
	BGFX_VIEW_MODE_DEPTH_ASCENDING,
	BGFX_VIEW_MODE_DEPTH_DESCENDING,

	BGFX_VIEW_MODE_COUNT
}

enum bgfx_render_frame_t
{
	BGFX_RENDER_FRAME_NO_CONTEXT,
	BGFX_RENDER_FRAME_RENDER,
	BGFX_RENDER_FRAME_TIMEOUT,
	BGFX_RENDER_FRAME_EXITING,

	BGFX_RENDER_FRAME_COUNT
}

alias bgfx_view_id_t = uint16_t;

struct bgfx_allocator_interface_t
{
	const(bgfx_allocator_vtbl_t*) vtbl;
}

struct bgfx_allocator_vtbl_t
{
	void* realloc(bgfx_allocator_interface_t* _this, void* _ptr, size_t _size, size_t _align, const(char*) _file, uint32_t _line);
}

struct bgfx_callback_interface_t
{
	const(bgfx_callback_vtbl_t*) vtbl;
}

struct bgfx_callback_vtbl_t
{
	void fatal(bgfx_callback_interface_t* _this, const(char*) _filePath, uint16_t _line, bgfx_fatal_t _code, const(char*) _str);
	void trace_vargs(bgfx_callback_interface_t* _this, const(char*) _filePath, uint16_t _line, const(char*) _format, va_list _argList);
	void profiler_begin(bgfx_callback_interface_t* _this, const(char*) _name, uint32_t _abgr, const(char*) _filePath, uint16_t _line);
	void profiler_begin_literal(bgfx_callback_interface_t* _this, const(char*) _name, uint32_t _abgr, const(char*) _filePath, uint16_t _line);
	void profiler_end(bgfx_callback_interface_t* _this);
	uint32_t cache_read_size(bgfx_callback_interface_t* _this, uint64_t _id);
	bool cache_read(bgfx_callback_interface_t* _this, uint64_t _id, void* _data, uint32_t _size);
	void cache_write(bgfx_callback_interface_t* _this, uint64_t _id, const(void*) _data, uint32_t _size);
	void screen_shot(bgfx_callback_interface_t* _this, const(char*) _filePath, uint32_t _width, uint32_t _height, uint32_t _pitch, const(void*) _data, uint32_t _size, bool _yflip);
	void capture_begin(bgfx_callback_interface_t* _this, uint32_t _width, uint32_t _height, uint32_t _pitch, bgfx_texture_format_t _format, bool _yflip);
	void capture_end(bgfx_callback_interface_t* _this);
	void capture_frame(bgfx_callback_interface_t* _this, const(void*) _data, uint32_t _size);
}

struct bgfx_dynamic_index_buffer_handle_t { uint16_t idx; }

struct bgfx_dynamic_vertex_buffer_handle_t { uint16_t idx; }

struct bgfx_frame_buffer_handle_t { uint16_t idx; }

struct bgfx_index_buffer_handle_t { uint16_t idx; }

struct bgfx_indirect_buffer_handle_t { uint16_t idx; }

struct bgfx_occlusion_query_handle_t { uint16_t idx; }

struct bgfx_program_handle_t { uint16_t idx; }

struct bgfx_shader_handle_t { uint16_t idx; }

struct bgfx_texture_handle_t { uint16_t idx; }

struct bgfx_uniform_handle_t { uint16_t idx; }

struct bgfx_vertex_buffer_handle_t { uint16_t idx; }

struct bgfx_vertex_layout_handle_t { uint16_t idx; }

alias bgfx_release_fn_t = void function(void* _ptr, void* _userData);

struct bgfx_caps_gpu_t
{
	uint16_t vendorId;
	uint16_t deviceId;
}

struct bgfx_caps_limits_t
{
	uint32_t maxDrawCalls;
	uint32_t maxBlits;
	uint32_t maxTextureSize;
	uint32_t maxTextureLayers;
	uint32_t maxViews;
	uint32_t maxFrameBuffers;
	uint32_t maxFBAttachments;
	uint32_t maxPrograms;
	uint32_t maxShaders;
	uint32_t maxTextures;
	uint32_t maxTextureSamplers;
	uint32_t maxComputeBindings;
	uint32_t maxVertexLayouts;
	uint32_t maxVertexStreams;
	uint32_t maxIndexBuffers;
	uint32_t maxVertexBuffers;
	uint32_t maxDynamicIndexBuffers;
	uint32_t maxDynamicVertexBuffers;
	uint32_t maxUniforms;
	uint32_t maxOcclusionQueries;
	uint32_t maxEncoders;
	uint32_t transientVbSize;
	uint32_t transientIbSize;
}

struct bgfx_caps_t
{
	bgfx_renderer_type_t rendererType;

	uint64_t supported;
	uint16_t vendorId;
	uint16_t deviceId;
	bool homogeneousDepth;
	bool originBottomLeft;
	uint8_t numGPUs;
	bgfx_caps_gpu_t[4] gpu;
	bgfx_caps_limits_t limits;

	uint16_t[bgfx_texture_format_t.BGFX_TEXTURE_FORMAT_COUNT] formats;
}

struct bgfx_internal_data_t
{
	const(bgfx_caps_t*) caps;
	void* context;
}

struct bgfx_platform_data_t
{
	void* ndt;
	void* nwh;
	void* context;
	void* backBuffer;
	void* backBufferDS;
}

struct bgfx_resolution_t
{
	bgfx_texture_format_t format;
	uint32_t width;
	uint32_t height;
	uint32_t reset;
	uint8_t numBackBuffers;
	uint8_t maxFrameLatency;
}

struct bgfx_init_limits_t
{
	uint16_t maxEncoders;
	uint32_t transientVbSize;
	uint32_t transientIbSize;
}

struct bgfx_init_t
{
	bgfx_renderer_type_t type;

	uint16_t vendorId;

	uint16_t deviceId;
	bool debug_;
	bool profile;
	bgfx_platform_data_t platformData;
	bgfx_resolution_t resolution;
	bgfx_init_limits_t limits;

	bgfx_callback_interface_t* callback;

	bgfx_allocator_interface_t* allocator;
}

struct bgfx_memory_t
{
	uint8_t* data;
	uint32_t size;
}

struct bgfx_transient_index_buffer_t
{
	uint8_t* data;
	uint32_t size;
	uint32_t startIndex;
	bgfx_index_buffer_handle_t handle;
}

struct bgfx_transient_vertex_buffer_t
{
	uint8_t* data;
	uint32_t size;
	uint32_t startVertex;
	uint16_t stride;
	bgfx_vertex_buffer_handle_t handle;
	bgfx_vertex_layout_handle_t layoutHandle;
}

struct bgfx_instance_data_buffer_t
{
	uint8_t* data;
	uint32_t size;
	uint32_t offset;
	uint32_t num;
	uint16_t stride;
	bgfx_vertex_buffer_handle_t handle;
}

struct bgfx_texture_info_t
{
	bgfx_texture_format_t format;
	uint32_t storageSize;
	uint16_t width;
	uint16_t height;
	uint16_t depth;
	uint16_t numLayers;
	uint8_t numMips;
	uint8_t bitsPerPixel;
	bool cubeMap;
}

struct bgfx_uniform_info_t
{
	char[256] name;
	bgfx_uniform_type_t type;
	uint16_t num;
}

struct bgfx_attachment_t
{
	bgfx_access_t access;
	bgfx_texture_handle_t handle;
	uint16_t mip;
	uint16_t layer;
	uint8_t resolve;
}

struct bgfx_transform_t
{
	float* data;
	uint16_t num;
}

struct bgfx_view_stats_t
{
	char[256] name;
	bgfx_view_id_t view;
	int64_t cpuTimeElapsed;
	int64_t gpuTimeElapsed;
}

struct bgfx_encoder_stats_t
{
	int64_t cpuTimeBegin;
	int64_t cpuTimeEnd;
}

struct bgfx_stats_t
{
	int64_t cpuTimeFrame;
	int64_t cpuTimeBegin;
	int64_t cpuTimeEnd;
	int64_t cpuTimerFreq;
	int64_t gpuTimeBegin;
	int64_t gpuTimeEnd;
	int64_t gpuTimerFreq;
	int64_t waitRender;
	int64_t waitSubmit;
	uint32_t numDraw;
	uint32_t numCompute;
	uint32_t numBlit;
	uint32_t maxGpuLatency;
	uint16_t numDynamicIndexBuffers;
	uint16_t numDynamicVertexBuffers;
	uint16_t numFrameBuffers;
	uint16_t numIndexBuffers;
	uint16_t numOcclusionQueries;
	uint16_t numPrograms;
	uint16_t numShaders;
	uint16_t numTextures;
	uint16_t numUniforms;
	uint16_t numVertexBuffers;
	uint16_t numVertexLayouts;
	int64_t textureMemoryUsed;
	int64_t rtMemoryUsed;
	int32_t transientVbUsed;
	int32_t transientIbUsed;
	uint32_t[bgfx_topology_t.BGFX_TOPOLOGY_COUNT] numPrims;
	int64_t gpuMemoryMax;
	int64_t gpuMemoryUsed;
	uint16_t width;
	uint16_t height;
	uint16_t textWidth;
	uint16_t textHeight;
	uint16_t numViews;
	bgfx_view_stats_t* viewStats;
	uint8_t numEncoders;
	bgfx_encoder_stats_t* encoderStats;
}

struct bgfx_vertex_layout_t
{
	uint32_t hash;
	uint16_t stride;
	uint16_t[bgfx_attrib_t.BGFX_ATTRIB_COUNT] offset;
	uint16_t[bgfx_attrib_t.BGFX_ATTRIB_COUNT] attributes;
}

struct bgfx_encoder_t { };

enum bgfx_function_id_t
{
	BGFX_FUNCTION_ID_ATTACHMENT_INIT,
	BGFX_FUNCTION_ID_VERTEX_LAYOUT_BEGIN,
	BGFX_FUNCTION_ID_VERTEX_LAYOUT_ADD,
	BGFX_FUNCTION_ID_VERTEX_LAYOUT_DECODE,
	BGFX_FUNCTION_ID_VERTEX_LAYOUT_HAS,
	BGFX_FUNCTION_ID_VERTEX_LAYOUT_SKIP,
	BGFX_FUNCTION_ID_VERTEX_LAYOUT_END,
	BGFX_FUNCTION_ID_VERTEX_PACK,
	BGFX_FUNCTION_ID_VERTEX_UNPACK,
	BGFX_FUNCTION_ID_VERTEX_CONVERT,
	BGFX_FUNCTION_ID_WELD_VERTICES,
	BGFX_FUNCTION_ID_TOPOLOGY_CONVERT,
	BGFX_FUNCTION_ID_TOPOLOGY_SORT_TRI_LIST,
	BGFX_FUNCTION_ID_GET_SUPPORTED_RENDERERS,
	BGFX_FUNCTION_ID_GET_RENDERER_NAME,
	BGFX_FUNCTION_ID_INIT_CTOR,
	BGFX_FUNCTION_ID_INIT,
	BGFX_FUNCTION_ID_SHUTDOWN,
	BGFX_FUNCTION_ID_RESET,
	BGFX_FUNCTION_ID_FRAME,
	BGFX_FUNCTION_ID_GET_RENDERER_TYPE,
	BGFX_FUNCTION_ID_GET_CAPS,
	BGFX_FUNCTION_ID_GET_STATS,
	BGFX_FUNCTION_ID_ALLOC,
	BGFX_FUNCTION_ID_COPY,
	BGFX_FUNCTION_ID_MAKE_REF,
	BGFX_FUNCTION_ID_MAKE_REF_RELEASE,
	BGFX_FUNCTION_ID_SET_DEBUG,
	BGFX_FUNCTION_ID_DBG_TEXT_CLEAR,
	BGFX_FUNCTION_ID_DBG_TEXT_PRINTF,
	BGFX_FUNCTION_ID_DBG_TEXT_VPRINTF,
	BGFX_FUNCTION_ID_DBG_TEXT_IMAGE,
	BGFX_FUNCTION_ID_CREATE_INDEX_BUFFER,
	BGFX_FUNCTION_ID_SET_INDEX_BUFFER_NAME,
	BGFX_FUNCTION_ID_DESTROY_INDEX_BUFFER,
	BGFX_FUNCTION_ID_CREATE_VERTEX_LAYOUT,
	BGFX_FUNCTION_ID_DESTROY_VERTEX_LAYOUT,
	BGFX_FUNCTION_ID_CREATE_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_SET_VERTEX_BUFFER_NAME,
	BGFX_FUNCTION_ID_DESTROY_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_CREATE_DYNAMIC_INDEX_BUFFER,
	BGFX_FUNCTION_ID_CREATE_DYNAMIC_INDEX_BUFFER_MEM,
	BGFX_FUNCTION_ID_UPDATE_DYNAMIC_INDEX_BUFFER,
	BGFX_FUNCTION_ID_DESTROY_DYNAMIC_INDEX_BUFFER,
	BGFX_FUNCTION_ID_CREATE_DYNAMIC_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_CREATE_DYNAMIC_VERTEX_BUFFER_MEM,
	BGFX_FUNCTION_ID_UPDATE_DYNAMIC_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_DESTROY_DYNAMIC_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_GET_AVAIL_TRANSIENT_INDEX_BUFFER,
	BGFX_FUNCTION_ID_GET_AVAIL_TRANSIENT_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_GET_AVAIL_INSTANCE_DATA_BUFFER,
	BGFX_FUNCTION_ID_ALLOC_TRANSIENT_INDEX_BUFFER,
	BGFX_FUNCTION_ID_ALLOC_TRANSIENT_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_ALLOC_TRANSIENT_BUFFERS,
	BGFX_FUNCTION_ID_ALLOC_INSTANCE_DATA_BUFFER,
	BGFX_FUNCTION_ID_CREATE_INDIRECT_BUFFER,
	BGFX_FUNCTION_ID_DESTROY_INDIRECT_BUFFER,
	BGFX_FUNCTION_ID_CREATE_SHADER,
	BGFX_FUNCTION_ID_GET_SHADER_UNIFORMS,
	BGFX_FUNCTION_ID_SET_SHADER_NAME,
	BGFX_FUNCTION_ID_DESTROY_SHADER,
	BGFX_FUNCTION_ID_CREATE_PROGRAM,
	BGFX_FUNCTION_ID_CREATE_COMPUTE_PROGRAM,
	BGFX_FUNCTION_ID_DESTROY_PROGRAM,
	BGFX_FUNCTION_ID_IS_TEXTURE_VALID,
	BGFX_FUNCTION_ID_CALC_TEXTURE_SIZE,
	BGFX_FUNCTION_ID_CREATE_TEXTURE,
	BGFX_FUNCTION_ID_CREATE_TEXTURE_2D,
	BGFX_FUNCTION_ID_CREATE_TEXTURE_2D_SCALED,
	BGFX_FUNCTION_ID_CREATE_TEXTURE_3D,
	BGFX_FUNCTION_ID_CREATE_TEXTURE_CUBE,
	BGFX_FUNCTION_ID_UPDATE_TEXTURE_2D,
	BGFX_FUNCTION_ID_UPDATE_TEXTURE_3D,
	BGFX_FUNCTION_ID_UPDATE_TEXTURE_CUBE,
	BGFX_FUNCTION_ID_READ_TEXTURE,
	BGFX_FUNCTION_ID_SET_TEXTURE_NAME,
	BGFX_FUNCTION_ID_GET_DIRECT_ACCESS_PTR,
	BGFX_FUNCTION_ID_DESTROY_TEXTURE,
	BGFX_FUNCTION_ID_CREATE_FRAME_BUFFER,
	BGFX_FUNCTION_ID_CREATE_FRAME_BUFFER_SCALED,
	BGFX_FUNCTION_ID_CREATE_FRAME_BUFFER_FROM_HANDLES,
	BGFX_FUNCTION_ID_CREATE_FRAME_BUFFER_FROM_ATTACHMENT,
	BGFX_FUNCTION_ID_CREATE_FRAME_BUFFER_FROM_NWH,
	BGFX_FUNCTION_ID_SET_FRAME_BUFFER_NAME,
	BGFX_FUNCTION_ID_GET_TEXTURE,
	BGFX_FUNCTION_ID_DESTROY_FRAME_BUFFER,
	BGFX_FUNCTION_ID_CREATE_UNIFORM,
	BGFX_FUNCTION_ID_GET_UNIFORM_INFO,
	BGFX_FUNCTION_ID_DESTROY_UNIFORM,
	BGFX_FUNCTION_ID_CREATE_OCCLUSION_QUERY,
	BGFX_FUNCTION_ID_GET_RESULT,
	BGFX_FUNCTION_ID_DESTROY_OCCLUSION_QUERY,
	BGFX_FUNCTION_ID_SET_PALETTE_COLOR,
	BGFX_FUNCTION_ID_SET_PALETTE_COLOR_RGBA8,
	BGFX_FUNCTION_ID_SET_VIEW_NAME,
	BGFX_FUNCTION_ID_SET_VIEW_RECT,
	BGFX_FUNCTION_ID_SET_VIEW_RECT_RATIO,
	BGFX_FUNCTION_ID_SET_VIEW_SCISSOR,
	BGFX_FUNCTION_ID_SET_VIEW_CLEAR,
	BGFX_FUNCTION_ID_SET_VIEW_CLEAR_MRT,
	BGFX_FUNCTION_ID_SET_VIEW_MODE,
	BGFX_FUNCTION_ID_SET_VIEW_FRAME_BUFFER,
	BGFX_FUNCTION_ID_SET_VIEW_TRANSFORM,
	BGFX_FUNCTION_ID_SET_VIEW_ORDER,
	BGFX_FUNCTION_ID_ENCODER_BEGIN,
	BGFX_FUNCTION_ID_ENCODER_END,
	BGFX_FUNCTION_ID_ENCODER_SET_MARKER,
	BGFX_FUNCTION_ID_ENCODER_SET_STATE,
	BGFX_FUNCTION_ID_ENCODER_SET_CONDITION,
	BGFX_FUNCTION_ID_ENCODER_SET_STENCIL,
	BGFX_FUNCTION_ID_ENCODER_SET_SCISSOR,
	BGFX_FUNCTION_ID_ENCODER_SET_SCISSOR_CACHED,
	BGFX_FUNCTION_ID_ENCODER_SET_TRANSFORM,
	BGFX_FUNCTION_ID_ENCODER_SET_TRANSFORM_CACHED,
	BGFX_FUNCTION_ID_ENCODER_ALLOC_TRANSFORM,
	BGFX_FUNCTION_ID_ENCODER_SET_UNIFORM,
	BGFX_FUNCTION_ID_ENCODER_SET_INDEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_DYNAMIC_INDEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_TRANSIENT_INDEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_DYNAMIC_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_TRANSIENT_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_VERTEX_COUNT,
	BGFX_FUNCTION_ID_ENCODER_SET_INSTANCE_DATA_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_INSTANCE_DATA_FROM_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_INSTANCE_DATA_FROM_DYNAMIC_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_INSTANCE_COUNT,
	BGFX_FUNCTION_ID_ENCODER_SET_TEXTURE,
	BGFX_FUNCTION_ID_ENCODER_TOUCH,
	BGFX_FUNCTION_ID_ENCODER_SUBMIT,
	BGFX_FUNCTION_ID_ENCODER_SUBMIT_OCCLUSION_QUERY,
	BGFX_FUNCTION_ID_ENCODER_SUBMIT_INDIRECT,
	BGFX_FUNCTION_ID_ENCODER_SET_COMPUTE_INDEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_COMPUTE_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_COMPUTE_DYNAMIC_INDEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_COMPUTE_DYNAMIC_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_COMPUTE_INDIRECT_BUFFER,
	BGFX_FUNCTION_ID_ENCODER_SET_IMAGE,
	BGFX_FUNCTION_ID_ENCODER_DISPATCH,
	BGFX_FUNCTION_ID_ENCODER_DISPATCH_INDIRECT,
	BGFX_FUNCTION_ID_ENCODER_DISCARD,
	BGFX_FUNCTION_ID_ENCODER_BLIT,
	BGFX_FUNCTION_ID_REQUEST_SCREEN_SHOT,
	BGFX_FUNCTION_ID_RENDER_FRAME,
	BGFX_FUNCTION_ID_SET_PLATFORM_DATA,
	BGFX_FUNCTION_ID_GET_INTERNAL_DATA,
	BGFX_FUNCTION_ID_OVERRIDE_INTERNAL_TEXTURE_PTR,
	BGFX_FUNCTION_ID_OVERRIDE_INTERNAL_TEXTURE,
	BGFX_FUNCTION_ID_SET_MARKER,
	BGFX_FUNCTION_ID_SET_STATE,
	BGFX_FUNCTION_ID_SET_CONDITION,
	BGFX_FUNCTION_ID_SET_STENCIL,
	BGFX_FUNCTION_ID_SET_SCISSOR,
	BGFX_FUNCTION_ID_SET_SCISSOR_CACHED,
	BGFX_FUNCTION_ID_SET_TRANSFORM,
	BGFX_FUNCTION_ID_SET_TRANSFORM_CACHED,
	BGFX_FUNCTION_ID_ALLOC_TRANSFORM,
	BGFX_FUNCTION_ID_SET_UNIFORM,
	BGFX_FUNCTION_ID_SET_INDEX_BUFFER,
	BGFX_FUNCTION_ID_SET_DYNAMIC_INDEX_BUFFER,
	BGFX_FUNCTION_ID_SET_TRANSIENT_INDEX_BUFFER,
	BGFX_FUNCTION_ID_SET_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_SET_DYNAMIC_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_SET_TRANSIENT_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_SET_VERTEX_COUNT,
	BGFX_FUNCTION_ID_SET_INSTANCE_DATA_BUFFER,
	BGFX_FUNCTION_ID_SET_INSTANCE_DATA_FROM_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_SET_INSTANCE_DATA_FROM_DYNAMIC_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_SET_INSTANCE_COUNT,
	BGFX_FUNCTION_ID_SET_TEXTURE,
	BGFX_FUNCTION_ID_TOUCH,
	BGFX_FUNCTION_ID_SUBMIT,
	BGFX_FUNCTION_ID_SUBMIT_OCCLUSION_QUERY,
	BGFX_FUNCTION_ID_SUBMIT_INDIRECT,
	BGFX_FUNCTION_ID_SET_COMPUTE_INDEX_BUFFER,
	BGFX_FUNCTION_ID_SET_COMPUTE_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_SET_COMPUTE_DYNAMIC_INDEX_BUFFER,
	BGFX_FUNCTION_ID_SET_COMPUTE_DYNAMIC_VERTEX_BUFFER,
	BGFX_FUNCTION_ID_SET_COMPUTE_INDIRECT_BUFFER,
	BGFX_FUNCTION_ID_SET_IMAGE,
	BGFX_FUNCTION_ID_DISPATCH,
	BGFX_FUNCTION_ID_DISPATCH_INDIRECT,
	BGFX_FUNCTION_ID_DISCARD,
	BGFX_FUNCTION_ID_BLIT,

	BGFX_FUNCTION_ID_COUNT
}

struct bgfx_interface_vtbl_t
{
	void attachment_init(bgfx_attachment_t* _this, bgfx_texture_handle_t _handle, bgfx_access_t _access, uint16_t _layer, uint16_t _mip, uint8_t _resolve);
	bgfx_vertex_layout_t* vertex_layout_begin(bgfx_vertex_layout_t* _this, bgfx_renderer_type_t _rendererType);
	bgfx_vertex_layout_t* vertex_layout_add(bgfx_vertex_layout_t* _this, bgfx_attrib_t _attrib, uint8_t _num, bgfx_attrib_type_t _type, bool _normalized, bool _asInt);
	void vertex_layout_decode(const(bgfx_vertex_layout_t*) _this, bgfx_attrib_t _attrib, uint8_t* _num, bgfx_attrib_type_t* _type, bool* _normalized, bool* _asInt);
	bool vertex_layout_has(const(bgfx_vertex_layout_t*) _this, bgfx_attrib_t _attrib);
	bgfx_vertex_layout_t* vertex_layout_skip(bgfx_vertex_layout_t* _this, uint8_t _num);
	void vertex_layout_end(bgfx_vertex_layout_t* _this);
	void vertex_pack(const float[4] _input, bool _inputNormalized, bgfx_attrib_t _attr, const(bgfx_vertex_layout_t*) _layout, void* _data, uint32_t _index);
	void vertex_unpack(float[4] _output, bgfx_attrib_t _attr, const(bgfx_vertex_layout_t*) _layout, const(void*) _data, uint32_t _index);
	void vertex_convert(const(bgfx_vertex_layout_t*) _dstLayout, void* _dstData, const(bgfx_vertex_layout_t*) _srcLayout, const(void*) _srcData, uint32_t _num);
	uint16_t weld_vertices(uint16_t* _output, const(bgfx_vertex_layout_t*) _layout, const(void*) _data, uint16_t _num, float _epsilon);
	uint32_t topology_convert(bgfx_topology_convert_t _conversion, void* _dst, uint32_t _dstSize, const(void*) _indices, uint32_t _numIndices, bool _index32);
	void topology_sort_tri_list(bgfx_topology_sort_t _sort, void* _dst, uint32_t _dstSize, const float[3] _dir, const float[3] _pos, const(void*) _vertices, uint32_t _stride, const(void*) _indices, uint32_t _numIndices, bool _index32);
	uint8_t get_supported_renderers(uint8_t _max, bgfx_renderer_type_t* _enum);
	const(char*) get_renderer_name(bgfx_renderer_type_t _type);
	void init_ctor(bgfx_init_t* _init);
	bool init(const(bgfx_init_t*) _init);
	void shutdown();
	void reset(uint32_t _width, uint32_t _height, uint32_t _flags, bgfx_texture_format_t _format);
	uint32_t frame(bool _capture);
	bgfx_renderer_type_t get_renderer_type();
	const(bgfx_caps_t*) get_caps();
	const(bgfx_stats_t*) get_stats();
	const(bgfx_memory_t*) alloc(uint32_t _size);
	const(bgfx_memory_t*) copy(const(void*) _data, uint32_t _size);
	const(bgfx_memory_t*) make_ref(const(void*) _data, uint32_t _size);
	const(bgfx_memory_t*) make_ref_release(const(void*) _data, uint32_t _size, bgfx_release_fn_t _releaseFn, void* _userData);
	void set_debug(uint32_t _debug);
	void dbg_text_clear(uint8_t _attr, bool _small);
	void dbg_text_printf(uint16_t _x, uint16_t _y, uint8_t _attr, const(char*) _format, ... );
	void dbg_text_vprintf(uint16_t _x, uint16_t _y, uint8_t _attr, const(char*) _format, va_list _argList);
	void dbg_text_image(uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height, const(void*) _data, uint16_t _pitch);
	bgfx_index_buffer_handle_t create_index_buffer(const(bgfx_memory_t*) _mem, uint16_t _flags);
	void set_index_buffer_name(bgfx_index_buffer_handle_t _handle, const(char*) _name, int32_t _len);
	void destroy_index_buffer(bgfx_index_buffer_handle_t _handle);
	bgfx_vertex_layout_handle_t create_vertex_layout(const(bgfx_vertex_layout_t*) _layout);
	void destroy_vertex_layout(bgfx_vertex_layout_handle_t _layoutHandle);
	bgfx_vertex_buffer_handle_t create_vertex_buffer(const(bgfx_memory_t*) _mem, const(bgfx_vertex_layout_t*) _layout, uint16_t _flags);
	void set_vertex_buffer_name(bgfx_vertex_buffer_handle_t _handle, const(char*) _name, int32_t _len);
	void destroy_vertex_buffer(bgfx_vertex_buffer_handle_t _handle);
	bgfx_dynamic_index_buffer_handle_t create_dynamic_index_buffer(uint32_t _num, uint16_t _flags);
	bgfx_dynamic_index_buffer_handle_t create_dynamic_index_buffer_mem(const(bgfx_memory_t*) _mem, uint16_t _flags);
	void update_dynamic_index_buffer(bgfx_dynamic_index_buffer_handle_t _handle, uint32_t _startIndex, const(bgfx_memory_t*) _mem);
	void destroy_dynamic_index_buffer(bgfx_dynamic_index_buffer_handle_t _handle);
	bgfx_dynamic_vertex_buffer_handle_t create_dynamic_vertex_buffer(uint32_t _num, const(bgfx_vertex_layout_t*) _layout, uint16_t _flags);
	bgfx_dynamic_vertex_buffer_handle_t create_dynamic_vertex_buffer_mem(const(bgfx_memory_t*) _mem, const(bgfx_vertex_layout_t*) _layout, uint16_t _flags);
	void update_dynamic_vertex_buffer(bgfx_dynamic_vertex_buffer_handle_t _handle, uint32_t _startVertex, const(bgfx_memory_t*) _mem);
	void destroy_dynamic_vertex_buffer(bgfx_dynamic_vertex_buffer_handle_t _handle);
	uint32_t get_avail_transient_index_buffer(uint32_t _num);
	uint32_t get_avail_transient_vertex_buffer(uint32_t _num, const(bgfx_vertex_layout_t*) _layout);
	uint32_t get_avail_instance_data_buffer(uint32_t _num, uint16_t _stride);
	void alloc_transient_index_buffer(bgfx_transient_index_buffer_t* _tib, uint32_t _num);
	void alloc_transient_vertex_buffer(bgfx_transient_vertex_buffer_t* _tvb, uint32_t _num, const(bgfx_vertex_layout_t*) _layout);
	bool alloc_transient_buffers(bgfx_transient_vertex_buffer_t* _tvb, const(bgfx_vertex_layout_t*) _layout, uint32_t _numVertices, bgfx_transient_index_buffer_t* _tib, uint32_t _numIndices);
	void alloc_instance_data_buffer(bgfx_instance_data_buffer_t* _idb, uint32_t _num, uint16_t _stride);
	bgfx_indirect_buffer_handle_t create_indirect_buffer(uint32_t _num);
	void destroy_indirect_buffer(bgfx_indirect_buffer_handle_t _handle);
	bgfx_shader_handle_t create_shader(const(bgfx_memory_t*) _mem);
	uint16_t get_shader_uniforms(bgfx_shader_handle_t _handle, bgfx_uniform_handle_t* _uniforms, uint16_t _max);
	void set_shader_name(bgfx_shader_handle_t _handle, const(char*) _name, int32_t _len);
	void destroy_shader(bgfx_shader_handle_t _handle);
	bgfx_program_handle_t create_program(bgfx_shader_handle_t _vsh, bgfx_shader_handle_t _fsh, bool _destroyShaders);
	bgfx_program_handle_t create_compute_program(bgfx_shader_handle_t _csh, bool _destroyShaders);
	void destroy_program(bgfx_program_handle_t _handle);
	bool is_texture_valid(uint16_t _depth, bool _cubeMap, uint16_t _numLayers, bgfx_texture_format_t _format, uint64_t _flags);
	void calc_texture_size(bgfx_texture_info_t* _info, uint16_t _width, uint16_t _height, uint16_t _depth, bool _cubeMap, bool _hasMips, uint16_t _numLayers, bgfx_texture_format_t _format);
	bgfx_texture_handle_t create_texture(const(bgfx_memory_t*) _mem, uint64_t _flags, uint8_t _skip, bgfx_texture_info_t* _info);
	bgfx_texture_handle_t create_texture_2d(uint16_t _width, uint16_t _height, bool _hasMips, uint16_t _numLayers, bgfx_texture_format_t _format, uint64_t _flags, const(bgfx_memory_t*) _mem);
	bgfx_texture_handle_t create_texture_2d_scaled(bgfx_backbuffer_ratio_t _ratio, bool _hasMips, uint16_t _numLayers, bgfx_texture_format_t _format, uint64_t _flags);
	bgfx_texture_handle_t create_texture_3d(uint16_t _width, uint16_t _height, uint16_t _depth, bool _hasMips, bgfx_texture_format_t _format, uint64_t _flags, const(bgfx_memory_t*) _mem);
	bgfx_texture_handle_t create_texture_cube(uint16_t _size, bool _hasMips, uint16_t _numLayers, bgfx_texture_format_t _format, uint64_t _flags, const(bgfx_memory_t*) _mem);
	void update_texture_2d(bgfx_texture_handle_t _handle, uint16_t _layer, uint8_t _mip, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height, const(bgfx_memory_t*) _mem, uint16_t _pitch);
	void update_texture_3d(bgfx_texture_handle_t _handle, uint8_t _mip, uint16_t _x, uint16_t _y, uint16_t _z, uint16_t _width, uint16_t _height, uint16_t _depth, const(bgfx_memory_t*) _mem);
	void update_texture_cube(bgfx_texture_handle_t _handle, uint16_t _layer, uint8_t _side, uint8_t _mip, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height, const(bgfx_memory_t*) _mem, uint16_t _pitch);
	uint32_t read_texture(bgfx_texture_handle_t _handle, void* _data, uint8_t _mip);
	void set_texture_name(bgfx_texture_handle_t _handle, const(char*) _name, int32_t _len);
	void* get_direct_access_ptr(bgfx_texture_handle_t _handle);
	void destroy_texture(bgfx_texture_handle_t _handle);
	bgfx_frame_buffer_handle_t create_frame_buffer(uint16_t _width, uint16_t _height, bgfx_texture_format_t _format, uint64_t _textureFlags);
	bgfx_frame_buffer_handle_t create_frame_buffer_scaled(bgfx_backbuffer_ratio_t _ratio, bgfx_texture_format_t _format, uint64_t _textureFlags);
	bgfx_frame_buffer_handle_t create_frame_buffer_from_handles(uint8_t _num, const(bgfx_texture_handle_t*) _handles, bool _destroyTexture);
	bgfx_frame_buffer_handle_t create_frame_buffer_from_attachment(uint8_t _num, const(bgfx_attachment_t*) _attachment, bool _destroyTexture);
	bgfx_frame_buffer_handle_t create_frame_buffer_from_nwh(void* _nwh, uint16_t _width, uint16_t _height, bgfx_texture_format_t _format, bgfx_texture_format_t _depthFormat);
	void set_frame_buffer_name(bgfx_frame_buffer_handle_t _handle, const(char*) _name, int32_t _len);
	bgfx_texture_handle_t get_texture(bgfx_frame_buffer_handle_t _handle, uint8_t _attachment);
	void destroy_frame_buffer(bgfx_frame_buffer_handle_t _handle);
	bgfx_uniform_handle_t create_uniform(const(char*) _name, bgfx_uniform_type_t _type, uint16_t _num);
	void get_uniform_info(bgfx_uniform_handle_t _handle, bgfx_uniform_info_t* _info);
	void destroy_uniform(bgfx_uniform_handle_t _handle);
	bgfx_occlusion_query_handle_t create_occlusion_query();
	bgfx_occlusion_query_result_t get_result(bgfx_occlusion_query_handle_t _handle, int32_t* _result);
	void destroy_occlusion_query(bgfx_occlusion_query_handle_t _handle);
	void set_palette_color(uint8_t _index, const float[4] _rgba);
	void set_palette_color_rgba8(uint8_t _index, uint32_t _rgba);
	void set_view_name(bgfx_view_id_t _id, const(char*) _name);
	void set_view_rect(bgfx_view_id_t _id, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height);
	void set_view_rect_ratio(bgfx_view_id_t _id, uint16_t _x, uint16_t _y, bgfx_backbuffer_ratio_t _ratio);
	void set_view_scissor(bgfx_view_id_t _id, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height);
	void set_view_clear(bgfx_view_id_t _id, uint16_t _flags, uint32_t _rgba, float _depth, uint8_t _stencil);
	void set_view_clear_mrt(bgfx_view_id_t _id, uint16_t _flags, float _depth, uint8_t _stencil, uint8_t _c0, uint8_t _c1, uint8_t _c2, uint8_t _c3, uint8_t _c4, uint8_t _c5, uint8_t _c6, uint8_t _c7);
	void set_view_mode(bgfx_view_id_t _id, bgfx_view_mode_t _mode);
	void set_view_frame_buffer(bgfx_view_id_t _id, bgfx_frame_buffer_handle_t _handle);
	void set_view_transform(bgfx_view_id_t _id, const(void*) _view, const(void*) _proj);
	void set_view_order(bgfx_view_id_t _id, uint16_t _num, const(bgfx_init_t*) _order);
	bgfx_encoder_t* encoder_begin(bool _forThread);
	void encoder_end(bgfx_encoder_t* _encoder);
	void encoder_set_marker(bgfx_encoder_t* _this, const(char*) _marker);
	void encoder_set_state(bgfx_encoder_t* _this, uint64_t _state, uint32_t _rgba);
	void encoder_set_condition(bgfx_encoder_t* _this, bgfx_occlusion_query_handle_t _handle, bool _visible);
	void encoder_set_stencil(bgfx_encoder_t* _this, uint32_t _fstencil, uint32_t _bstencil);
	uint16_t encoder_set_scissor(bgfx_encoder_t* _this, uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height);
	void encoder_set_scissor_cached(bgfx_encoder_t* _this, uint16_t _cache);
	uint32_t encoder_set_transform(bgfx_encoder_t* _this, const(void*) _mtx, uint16_t _num);
	void encoder_set_transform_cached(bgfx_encoder_t* _this, uint32_t _cache, uint16_t _num);
	uint32_t encoder_alloc_transform(bgfx_encoder_t* _this, bgfx_transform_t* _transform, uint16_t _num);
	void encoder_set_uniform(bgfx_encoder_t* _this, bgfx_uniform_handle_t _handle, const(void*) _value, uint16_t _num);
	void encoder_set_index_buffer(bgfx_encoder_t* _this, bgfx_index_buffer_handle_t _handle, uint32_t _firstIndex, uint32_t _numIndices);
	void encoder_set_dynamic_index_buffer(bgfx_encoder_t* _this, bgfx_dynamic_index_buffer_handle_t _handle, uint32_t _firstIndex, uint32_t _numIndices);
	void encoder_set_transient_index_buffer(bgfx_encoder_t* _this, const(bgfx_transient_index_buffer_t*) _tib, uint32_t _firstIndex, uint32_t _numIndices);
	void encoder_set_vertex_buffer(bgfx_encoder_t* _this, uint8_t _stream, bgfx_vertex_buffer_handle_t _handle, uint32_t _startVertex, uint32_t _numVertices, bgfx_vertex_layout_handle_t _layoutHandle);
	void encoder_set_dynamic_vertex_buffer(bgfx_encoder_t* _this, uint8_t _stream, bgfx_dynamic_vertex_buffer_handle_t _handle, uint32_t _startVertex, uint32_t _numVertices, bgfx_vertex_layout_handle_t _layoutHandle);
	void encoder_set_transient_vertex_buffer(bgfx_encoder_t* _this, uint8_t _stream, const(bgfx_transient_vertex_buffer_t*) _tvb, uint32_t _startVertex, uint32_t _numVertices, bgfx_vertex_layout_handle_t _layoutHandle);
	void encoder_set_vertex_count(bgfx_encoder_t* _this, uint32_t _numVertices);
	void encoder_set_instance_data_buffer(bgfx_encoder_t* _this, const(bgfx_instance_data_buffer_t*) _idb, uint32_t _start, uint32_t _num);
	void encoder_set_instance_data_from_vertex_buffer(bgfx_encoder_t* _this, bgfx_vertex_buffer_handle_t _handle, uint32_t _startVertex, uint32_t _num);
	void encoder_set_instance_data_from_dynamic_vertex_buffer(bgfx_encoder_t* _this, bgfx_dynamic_vertex_buffer_handle_t _handle, uint32_t _startVertex, uint32_t _num);
	void encoder_set_instance_count(bgfx_encoder_t* _this, uint32_t _numInstances);
	void encoder_set_texture(bgfx_encoder_t* _this, uint8_t _stage, bgfx_uniform_handle_t _sampler, bgfx_texture_handle_t _handle, uint32_t _flags);
	void encoder_touch(bgfx_encoder_t* _this, bgfx_view_id_t _id);
	void encoder_submit(bgfx_encoder_t* _this, bgfx_view_id_t _id, bgfx_program_handle_t _program, uint32_t _depth, bool _preserveState);
	void encoder_submit_occlusion_query(bgfx_encoder_t* _this, bgfx_view_id_t _id, bgfx_program_handle_t _program, bgfx_occlusion_query_handle_t _occlusionQuery, uint32_t _depth, bool _preserveState);
	void encoder_submit_indirect(bgfx_encoder_t* _this, bgfx_view_id_t _id, bgfx_program_handle_t _program, bgfx_indirect_buffer_handle_t _indirectHandle, uint16_t _start, uint16_t _num, uint32_t _depth, bool _preserveState);
	void encoder_set_compute_index_buffer(bgfx_encoder_t* _this, uint8_t _stage, bgfx_index_buffer_handle_t _handle, bgfx_access_t _access);
	void encoder_set_compute_vertex_buffer(bgfx_encoder_t* _this, uint8_t _stage, bgfx_vertex_buffer_handle_t _handle, bgfx_access_t _access);
	void encoder_set_compute_dynamic_index_buffer(bgfx_encoder_t* _this, uint8_t _stage, bgfx_dynamic_index_buffer_handle_t _handle, bgfx_access_t _access);
	void encoder_set_compute_dynamic_vertex_buffer(bgfx_encoder_t* _this, uint8_t _stage, bgfx_dynamic_vertex_buffer_handle_t _handle, bgfx_access_t _access);
	void encoder_set_compute_indirect_buffer(bgfx_encoder_t* _this, uint8_t _stage, bgfx_indirect_buffer_handle_t _handle, bgfx_access_t _access);
	void encoder_set_image(bgfx_encoder_t* _this, uint8_t _stage, bgfx_texture_handle_t _handle, uint8_t _mip, bgfx_access_t _access, bgfx_texture_format_t _format);
	void encoder_dispatch(bgfx_encoder_t* _this, bgfx_view_id_t _id, bgfx_program_handle_t _program, uint32_t _numX, uint32_t _numY, uint32_t _numZ);
	void encoder_dispatch_indirect(bgfx_encoder_t* _this, bgfx_view_id_t _id, bgfx_program_handle_t _program, bgfx_indirect_buffer_handle_t _indirectHandle, uint16_t _start, uint16_t _num);
	void encoder_discard(bgfx_encoder_t* _this);
	void encoder_blit(bgfx_encoder_t* _this, bgfx_view_id_t _id, bgfx_texture_handle_t _dst, uint8_t _dstMip, uint16_t _dstX, uint16_t _dstY, uint16_t _dstZ, bgfx_texture_handle_t _src, uint8_t _srcMip, uint16_t _srcX, uint16_t _srcY, uint16_t _srcZ, uint16_t _width, uint16_t _height, uint16_t _depth);
	void request_screen_shot(bgfx_frame_buffer_handle_t _handle, const(char*) _filePath);
	bgfx_render_frame_t render_frame(int32_t _msecs);
	void set_platform_data(const(bgfx_platform_data_t*) _data);
	const(bgfx_internal_data_t*) get_internal_data();
	uintptr_t override_internal_texture_ptr(bgfx_texture_handle_t _handle, uintptr_t _ptr);
	uintptr_t override_internal_texture(bgfx_texture_handle_t _handle, uint16_t _width, uint16_t _height, uint8_t _numMips, bgfx_texture_format_t _format, uint64_t _flags);
	void set_marker(const(char*) _marker);
	void set_state(uint64_t _state, uint32_t _rgba);
	void set_condition(bgfx_occlusion_query_handle_t _handle, bool _visible);
	void set_stencil(uint32_t _fstencil, uint32_t _bstencil);
	uint16_t set_scissor(uint16_t _x, uint16_t _y, uint16_t _width, uint16_t _height);
	void set_scissor_cached(uint16_t _cache);
	uint32_t set_transform(const(void*) _mtx, uint16_t _num);
	void set_transform_cached(uint32_t _cache, uint16_t _num);
	uint32_t alloc_transform(bgfx_transform_t* _transform, uint16_t _num);
	void set_uniform(bgfx_uniform_handle_t _handle, const(void*) _value, uint16_t _num);
	void set_index_buffer(bgfx_index_buffer_handle_t _handle, uint32_t _firstIndex, uint32_t _numIndices);
	void set_dynamic_index_buffer(bgfx_dynamic_index_buffer_handle_t _handle, uint32_t _firstIndex, uint32_t _numIndices);
	void set_transient_index_buffer(const(bgfx_transient_index_buffer_t*) _tib, uint32_t _firstIndex, uint32_t _numIndices);
	void set_vertex_buffer(uint8_t _stream, bgfx_vertex_buffer_handle_t _handle, uint32_t _startVertex, uint32_t _numVertices);
	void set_dynamic_vertex_buffer(uint8_t _stream, bgfx_dynamic_vertex_buffer_handle_t _handle, uint32_t _startVertex, uint32_t _numVertices);
	void set_transient_vertex_buffer(uint8_t _stream, const(bgfx_transient_vertex_buffer_t*) _tvb, uint32_t _startVertex, uint32_t _numVertices);
	void set_vertex_count(uint32_t _numVertices);
	void set_instance_data_buffer(const(bgfx_instance_data_buffer_t*) _idb, uint32_t _start, uint32_t _num);
	void set_instance_data_from_vertex_buffer(bgfx_vertex_buffer_handle_t _handle, uint32_t _startVertex, uint32_t _num);
	void set_instance_data_from_dynamic_vertex_buffer(bgfx_dynamic_vertex_buffer_handle_t _handle, uint32_t _startVertex, uint32_t _num);
	void set_instance_count(uint32_t _numInstances);
	void set_texture(uint8_t _stage, bgfx_uniform_handle_t _sampler, bgfx_texture_handle_t _handle, uint32_t _flags);
	void touch(bgfx_view_id_t _id);
	void submit(bgfx_view_id_t _id, bgfx_program_handle_t _program, uint32_t _depth, bool _preserveState);
	void submit_occlusion_query(bgfx_view_id_t _id, bgfx_program_handle_t _program, bgfx_occlusion_query_handle_t _occlusionQuery, uint32_t _depth, bool _preserveState);
	void submit_indirect(bgfx_view_id_t _id, bgfx_program_handle_t _program, bgfx_indirect_buffer_handle_t _indirectHandle, uint16_t _start, uint16_t _num, uint32_t _depth, bool _preserveState);
	void set_compute_index_buffer(uint8_t _stage, bgfx_index_buffer_handle_t _handle, bgfx_access_t _access);
	void set_compute_vertex_buffer(uint8_t _stage, bgfx_vertex_buffer_handle_t _handle, bgfx_access_t _access);
	void set_compute_dynamic_index_buffer(uint8_t _stage, bgfx_dynamic_index_buffer_handle_t _handle, bgfx_access_t _access);
	void set_compute_dynamic_vertex_buffer(uint8_t _stage, bgfx_dynamic_vertex_buffer_handle_t _handle, bgfx_access_t _access);
	void set_compute_indirect_buffer(uint8_t _stage, bgfx_indirect_buffer_handle_t _handle, bgfx_access_t _access);
	void set_image(uint8_t _stage, bgfx_texture_handle_t _handle, uint8_t _mip, bgfx_access_t _access, bgfx_texture_format_t _format);
	void dispatch(bgfx_view_id_t _id, bgfx_program_handle_t _program, uint32_t _numX, uint32_t _numY, uint32_t _numZ);
	void dispatch_indirect(bgfx_view_id_t _id, bgfx_program_handle_t _program, bgfx_indirect_buffer_handle_t _indirectHandle, uint16_t _start, uint16_t _num);
	void discard();
	void blit(bgfx_view_id_t _id, bgfx_texture_handle_t _dst, uint8_t _dstMip, uint16_t _dstX, uint16_t _dstY, uint16_t _dstZ, bgfx_texture_handle_t _src, uint8_t _srcMip, uint16_t _srcX, uint16_t _srcY, uint16_t _srcZ, uint16_t _width, uint16_t _height, uint16_t _depth);
};

alias PFN_BGFX_GET_INTERFACE = bgfx_interface_vtbl_t* function(uint32_t _version);
