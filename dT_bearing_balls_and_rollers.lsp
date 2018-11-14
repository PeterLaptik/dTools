; ---------------------------------------------------------------------------
; ---------------------------------- Balls ----------------------------------
; ---------------------------------------------------------------------------

(defun dT_make_balls_0 (D dm B r Dw n_balls D1 ax bx /
			obj_for_union ring_thk init_dist
			coeff_filling coeff_sphere)
  (setq coeff_sphere 1.15)	; sphere coefficient
  (setq coeff_filling 1.5)	; sphere filling coefficient
  (setq obj_for_union (ssadd))
  (setq ring_thk (/ (/ (- D dm) 2.0) 3.0))
  (if (<= n_balls 0)
    (progn
      (setq n_balls (fix
			(/
			  ( / (* 2 (* PI (+ (/ dm 2.0) (/ (- D dm) 4.0)))) (* coeff_filling (* coeff_sphere ring_thk)))
			  4)
			)
	    )
      (setq n_balls (* n_balls 4))
      )
    )
  (setq my_arc (/ 360.0 (+ n_balls 1)))

  (command "_sphere" (list 0 (+ (/ dm 2.0) (/ (- D dm) 4.0)) 0) "_d" (* coeff_sphere ring_thk))
  (ssadd (entlast) obj_for_union)
  (command "_ucs" "_ZA" (list 0 0 0) (list 100 0 0))
  (while (> n_balls 0)
    (progn
      (setq n_balls (1- n_balls))
      (command "_rotate" (entlast) "" (list 0 0 0) "_C" my_arc)
      (ssadd (entlast) obj_for_union)
      ); end progn
    ); end while
  (command "_union" obj_for_union "")
  (command "_ucs" "")
  )


(defun dT_make_balls_60000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_balls_0 D dm B r Dw n_balls D1 ax bx)
  )


(defun dT_make_balls_80000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_balls_0 D dm B r Dw n_balls D1 ax bx)
  )


(defun dT_make_balls_160000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_balls_0 D dm B r Dw n_balls D1 ax bx)
  )


(defun dT_make_balls_180000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_balls_0 D dm B r Dw n_balls D1 ax bx)
  )

; ---------------------------------------------------------------------------
; --------------------------------- Separators ------------------------------
; ---------------------------------------------------------------------------

(defun dT_make_ring_separator_0 (D dm B r Dw n_balls D1 ax bx / result)
  (setq result nil)
  )


(defun dT_make_ring_separator_60000 (D dm B r Dw n_balls D1 ax bx / result)
  (setq result nil)
  )


(defun dT_make_ring_separator_80000 (D dm B r Dw n_balls D1 ax bx / result)
  (setq result nil)
  )

; Single row
(defun dT_make_ring_separator_160000 (D dm B r Dw n_balls D1 ax bx /
				      ring_thk obj_to_del obj_separ obj_for_extraction
				      coeff_separ coeff_sphere coeff_filling)
  (setq coeff_sphere 1.15)	; sphere coeffitient
  (setq coeff_separ 1.2)	; separator width coefficient
  (setq coeff_filling 1.5)	; sphere filling coefficient
  (setq obj_to_del (ssadd))
  (setq ring_thk (/ (/ (- D dm) 2.0) 3.0))
  ; flat geometry
  (command "_pline"
	   (list
	     (- (- 0 (* (/ (* coeff_sphere ring_thk) 2) coeff_separ)))
	     (+ (+ (/ dm 2) (/ (/ (- D dm) 4.0))) (/ (* (- coeff_separ 1) (* coeff_sphere ring_thk)) 2))
	     0)
	   (list
	     (+ (- 0 (* (/ (* coeff_sphere ring_thk) 2) coeff_separ)))
	     (+ (+ (/ dm 2) (/ (/ (- D dm) 4.0))) (/ (* (- coeff_separ 1) (* coeff_sphere ring_thk)) 2))
	     0)
	   (list
	     (+ (- 0 (* (/ (* coeff_sphere ring_thk) 2) coeff_separ)))
	     (- (+ (/ dm 2) (/ (/ (- D dm) 4.0))) (/ (* (- coeff_separ 1) (* coeff_sphere ring_thk)) 2))
	     0)
	   (list
	     (- (- 0 (* (/ (* coeff_sphere ring_thk) 2) coeff_separ)))
	     (- (+ (/ dm 2) (/ (/ (- D dm) 4.0))) (/ (* (- coeff_separ 1) (* coeff_sphere ring_thk)) 2))
	     0)
	     "_c")
  (ssadd (entlast) obj_to_del)
  (command "_revolve" (entlast) "" (list 0 0 0) (list 100 0 0) "360")
  (setq obj_separ (entlast))
  
  (setq obj_for_extraction (ssadd))
  (command "_sphere" (list 0 (+ (/ dm 2.0) (/ (- D dm) 4.0)) 0) "_d" (* coeff_sphere ring_thk))
  (ssadd (entlast) obj_for_extraction)
  (if (<= n_balls 0)
    (progn
      (setq n_balls (fix
			(/
			  ( / (* 2 (* PI (+ (/ dm 2.0) (/ (- D dm) 4.0)))) (* coeff_filling (* coeff_sphere ring_thk)))
			  4)
			)
	    )
      (setq n_balls (* n_balls 4))
      )
    ); spheres number
  (setq my_arc (/ 360.0 n_balls))
  (command "_ucs" "_ZA" (list 0 0 0) (list 100 0 0))
  (while (> n_balls 0)
    (progn
      (setq n_balls (1- n_balls))
      (command "_rotate" (entlast) "" (list 0 0 0) "_C" my_arc)
      (ssadd (entlast) obj_for_extraction)
      )
    ); end while
  (command "_erase" obj_to_del "")
  (command "_subtract" obj_separ "" obj_for_extraction "")
  (command "_ucs" "")
  )

(defun dT_make_ring_separator_180000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_ring_separator_160000 D dm B r Dw n_balls D1 ax bx)
  )