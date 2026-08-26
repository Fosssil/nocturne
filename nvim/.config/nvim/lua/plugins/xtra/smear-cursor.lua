return {
	{
		"sphamba/smear-cursor.nvim",
		enabled = false,
		event = "VeryLazy",

		opts = {
			------------------------------------------------------------------
			-- General
			------------------------------------------------------------------
			smear_between_buffers = true,
			-- smear_between_neighbor_lines = true,
			smear_between_neighbor_lines = false,

			min_horizontal_distance_smear = 0,
			min_vertical_distance_smear = 0,

			smear_horizontally = true,
			smear_vertically = true,
			smear_diagonally = true,

			smear_to_cmd = true,

			scroll_buffer_space = true,

			legacy_computing_symbols_support = false,
			legacy_computing_symbols_support_vertical_bars = false,
			use_diagonal_blocks = true,

			smear_insert_mode = true,
			smear_replace_mode = false,
			smear_terminal_mode = false,

			never_draw_over_target = false,
			hide_target_hack = false,

			max_kept_windows = 50,
			windows_zindex = 300,

			filetypes_disabled = {},

			------------------------------------------------------------------
			-- Timing
			------------------------------------------------------------------
			time_interval = 8,

			delay_disable = nil,

			delay_event_to_smear = 1,
			-- delay_after_key = 4,
			delay_after_key = 2,

			------------------------------------------------------------------
			-- Motion Physics
			------------------------------------------------------------------
			stiffness = 0.68,
			trailing_stiffness = 0.60,

			anticipation = 0.12,

			damping = 0.92,

			trailing_exponent = 1.9,

			distance_stop_animating = 0.45,

			------------------------------------------------------------------
			-- Insert Mode
			------------------------------------------------------------------
			stiffness_insert_mode = 0.70,
			trailing_stiffness_insert_mode = 0.70,

			damping_insert_mode = 0.95,

			trailing_exponent_insert_mode = 1,

			max_length_insert_mode = 1,

			------------------------------------------------------------------
			-- Rendering
			------------------------------------------------------------------
			-- max_length = 20,
			max_length = 2,

			color_levels = 16,
			gamma = 2.2,
			gradient_exponent = 1,

			matrix_pixel_threshold = 0.7,
			matrix_pixel_threshold_vertical_bar = 0.25,
			matrix_pixel_min_factor = 0.5,

			volume_reduction_exponent = 0.3,
			minimum_volume_factor = 0.7,

			------------------------------------------------------------------
			-- Particles
			------------------------------------------------------------------
			particles_enabled = false,
		},
	},
}
