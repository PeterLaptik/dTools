
; incoming: b_type D dm B r Dw n_balls D1 ax bx
(defun c:dT-bearing ( / type_name func_to_call
		     osmode_old osmode3d_old obj_for_union
		     obj_outer_ring obj_inner_ring obj_balls obj_separator
		     obj_pack_L obj_pack_R)

  ; functions names
  (setq type_name "create_bearing_type_")
  (setq func_outer_ring "dT_make_outer_ring_")
  (setq func_inner_ring "dT_make_inner_ring_")
  (setq func_ring_groove "dT_make_ring_groove_")
  (setq func_separator "dT_make_ring_separator_")
  (setq func_balls "dT_make_balls_")
  (setq func_packL "dT_make_packL_")
  (setq func_packR "dT_make_packR_")
  

  (setq b_type "180000")						; testing
  (setq B 21)							; testing
  (setq dm 35)							; testing
  (setq D 80)							; testing
  (setq r 1.5)							; testing
  (setq Dw 0)							; testing
  (setq n_balls 0)						; testing
  (setq D1 76.81)						; testing
  (setq ax 3.28)						; testing
  (setq bx 2.2)							; testing
  
  ; pre initializations
  (setq osmode_old (getvar "osmode"))
  (setq osmode3d_old (getvar "3dosmode"))
  (setvar "osmode" 0)
  (setvar "3Dosmode" 1)
  (command "_ucs" "")
  
  ; bearing creating
  ; outer ring
  (setq func_to_call (strcat func_outer_ring b_type))
  (eval
    (list
      (read func_to_call)
      D dm B r Dw n_balls D1 ax bx
      )
    )
  (setq obj_outer_ring (entlast))

  ; inner ring
  (setq func_to_call (strcat func_inner_ring b_type))
  (eval
    (list
      (read func_to_call)
      D dm B r Dw n_balls D1 ax bx
      )
    )
  (setq obj_inner_ring (entlast))

  ; ring groove
  (setq func_to_call (strcat func_ring_groove b_type))
  (eval
    (list
      (read func_to_call)
      D dm B r Dw n_balls D1 ax bx
      )
    )
  (command "_subtract" obj_outer_ring obj_inner_ring "" (entlast) "")
  
  ; balls
  (setq func_to_call (strcat func_balls b_type))
  (eval
    (list
      (read func_to_call)
      D dm B r Dw n_balls D1 ax bx
      )
    )
  (setq obj_balls (entlast))

  ; separator
  (setq func_to_call (strcat func_separator b_type))
  (eval
    (list
      (read func_to_call)
      D dm B r Dw n_balls D1 ax bx
      )
    )
  (setq obj_separator (entlast))

  ; left pack
  (setq func_to_call (strcat func_packL b_type))
  (eval
    (list
      (read func_to_call)
      D dm B r Dw n_balls D1 ax bx
      )
    )
  (setq obj_pack_L (entlast))

  ; right pack
  (setq func_to_call (strcat func_packR b_type))
  (eval
    (list
      (read func_to_call)
      D dm B r Dw n_balls D1 ax bx
      )
    )
  (setq obj_pack_R (entlast))

  (command "_union" obj_outer_ring obj_inner_ring
	   obj_balls obj_separator
	   obj_pack_L obj_pack_R "")
  
  ; post initializations
  (command "_ucs" "")
  (setvar "osmode" osmode_old)
  (setvar "3dosmode" osmode3D_old)
  )




