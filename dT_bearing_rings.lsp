; ---------------------------------------------------------------------------
; --------------------------------Outer ring---------------------------------
; ---------------------------------------------------------------------------

(defun dT_make_outer_ring_0 (D dm B r Dw n_balls D1 ax bx /
			     obj_to_del ring_thk init_dist)
  (setq obj_to_del (ssadd))
  (setq ring_thk (/ (/ (- D dm) 2.0) 3.0))
  (setq init_dist (- (/ D 2.0) r))

  (command "_pline"
	   (list (/ B 2.0) init_dist 0)
	   (list (- (/ B 2.0) r) (+ init_dist r) 0)
	   (list (- r (/ B 2.0)) (+ init_dist r) 0)
	   (list (- 0 (/ B 2.0)) init_dist 0)
	   (list (- 0 (/ B 2.0)) (- (+ init_dist r) ring_thk) 0)
	   (list (+ 0 (/ B 2.0)) (- (+ init_dist r) ring_thk) 0)
	   "_c")
  (ssadd (entlast) obj_to_del)
  (command "_revolve" (entlast) "" (list 0 0 0) (list 100 0 0) "360")
  (command "_erase" obj_to_del "")
  )


(defun dT_make_outer_ring_60000 (D dm B r Dw n_balls D1 ax bx /
				 obj_to_del ring_thk init_dist)
  (setq obj_to_del (ssadd))
  (setq coeff_groove 0.05)	; coefficient for groove
  (setq ring_thk (/ (/ (- D dm) 2.0) 3.0))
  (setq init_dist (- (/ D 2.0) r))
  (command "_pline"
	   (list (/ B 2.0) init_dist 0)
	   (list (- (/ B 2.0) r) (+ init_dist r) 0)
	   (list (- r (/ B 2.0)) (+ init_dist r) 0)
	   (list (- 0 (/ B 2.0)) init_dist 0)
	   (list (- 0 (/ B 2.0)) (- (+ init_dist r) ring_thk) 0)
	   (list (- (+ 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) ring_thk) 0)
	   (list (- (+ 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) (* (* (/ ring_thk 5) 4) (- 1 coeff_groove))  0))
	   (list (- (+ 0 (/ B 2.0))(* (/ B 5) (- 1 coeff_groove))) (- (+ init_dist r) (* (* (/ ring_thk 5) 4) (- 1 coeff_groove))  0))
	   (list (- (+ 0 (/ B 2.0))(* (/ B 5) (- 1 coeff_groove))) (- (+ init_dist r) (* (/ ring_thk 5) 4))  0)
	   (list (/ B 2.0) (- (+ init_dist r) (*(/ ring_thk 5) 4) 0))
	   "_c")
  (ssadd (entlast) obj_to_del)
  (command "_revolve" (entlast) "" (list 0 0 0) (list 100 0 0) "360")
  (command "_erase" obj_to_del "")
  )


(defun dT_make_outer_ring_80000 (D dm B r Dw n_balls D1 ax bx /
				 obj_to_del ring_thk init_dist)
  (setq obj_to_del (ssadd))
  (setq coeff_groove 0.05)	; coefficient for groove
  (setq ring_thk (/ (/ (- D dm) 2.0) 3.0))
  (setq init_dist (- (/ D 2.0) r))
  (command "_pline"
	   (list (/ B 2.0) init_dist 0)
	   (list (- (/ B 2.0) r) (+ init_dist r) 0)
	   (list (- r (/ B 2.0)) (+ init_dist r) 0)
	   (list (- 0 (/ B 2.0)) init_dist 0)
	   (list (- 0 (/ B 2.0)) (- (+ init_dist r) (* (/ ring_thk 5) 4)) 0)
	   (list (+ (- 0 (/ B 2.0))(* (/ B 5) (- 1 coeff_groove))) (- (+ init_dist r) (* (/ ring_thk 5) 4)) 0)
	   (list (+ (- 0 (/ B 2.0))(* (/ B 5) (- 1 coeff_groove)))
		 (- (+ init_dist r) (* (* (/ ring_thk 5) 4) (- 1 coeff_groove)) 0)
		 0)
	   (list (+ (- 0 (/ B 2.0))(* (/ B 5) 1))
		 (- (+ init_dist r) (* (* (/ ring_thk 5) 4) (- 1 coeff_groove)) 0)
		 0)
	   (list (+ (- 0 (/ B 2.0))(* (/ B 5) 1))
		 (- (+ init_dist r) ring_thk)
		 0)
	   (list (- (+ 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) ring_thk) 0)
	   (list (- (+ 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) (* (* (/ ring_thk 5) 4) (- 1 coeff_groove))  0))
	   (list (- (+ 0 (/ B 2.0))(* (/ B 5) (- 1 coeff_groove))) (- (+ init_dist r) (* (* (/ ring_thk 5) 4) (- 1 coeff_groove))  0))
	   (list (- (+ 0 (/ B 2.0))(* (/ B 5) (- 1 coeff_groove))) (- (+ init_dist r) (* (/ ring_thk 5) 4))  0)
	   (list (/ B 2.0) (- (+ init_dist r) (* (/ ring_thk 5) 4) 0))
	   "_c")
  (ssadd (entlast) obj_to_del)
  (command "_revolve" (entlast) "" (list 0 0 0) (list 100 0 0) "360")
  (command "_erase" obj_to_del "")
  )


(defun dT_make_outer_ring_160000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_outer_ring_60000 D dm B r Dw n_balls D1 ax bx)
  )


(defun dT_make_outer_ring_180000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_outer_ring_80000 D dm B r Dw n_balls D1 ax bx)
  )


; ---------------------------------------------------------------------------
; --------------------------------Inner ring---------------------------------
; ---------------------------------------------------------------------------

(defun dT_make_inner_ring_0 (D dm B r Dw n_balls D1 ax bx /
			     obj_to_del ring_thk init_dist)
  (setq obj_to_del (ssadd))
  (setq ring_thk (/ (/ (- D dm) 2.0) 3.0))
  (setq init_dist (- (/ D 2.0) r))
  (command "_pline"
	   (list (/ B 2.0) init_dist 0)
	   (list (- (/ B 2.0) r) (+ init_dist r) 0)
	   (list (- r (/ B 2.0)) (+ init_dist r) 0)
	   (list (- 0 (/ B 2.0)) init_dist 0)
	   (list (- 0 (/ B 2.0)) (- (+ init_dist r) ring_thk) 0)
	   (list (+ 0 (/ B 2.0)) (- (+ init_dist r) ring_thk) 0)
	   "_c")
  (command "_mirror" (entlast) "" (list 0 (+ (/ dm 2.0) (/ (- D dm) 4.0))) (list 100 (+ (/ dm 2.0) (/ (- D dm) 4.0))) "_Y")
  (ssadd (entlast) obj_to_del)
  (command "_revolve" (entlast) "" (list 0 0 0) (list 100 0 0) "360")
  (command "_erase" obj_to_del "")
  )


(defun dT_make_inner_ring_60000 (D dm B r Dw n_balls D1 ax bx /
				 obj_to_del ring_thk init_dist)
  (setq obj_to_del (ssadd))
  (setq ring_thk (/ (/ (- D dm) 2.0) 3.0))
  (setq init_dist (- (/ D 2.0) r))
  (command "_pline"
	   (list (/ B 2.0) init_dist 0)
	   (list (- (/ B 2.0) r) (+ init_dist r) 0)
	   (list (- r (/ B 2.0)) (+ init_dist r) 0)
	   (list (- 0 (/ B 2.0)) init_dist 0)
	   (list (- 0 (/ B 2.0)) (- (+ init_dist r) ring_thk) 0)
	   (list (- (+ 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) ring_thk) 0)
	   (list (- (+ 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) (* (/ ring_thk 5) 4))  0)
	   (list (/ B 2.0) (- (+ init_dist r) (*(/ ring_thk 5) 4) 0))
	   "_c")
  (command "_mirror" (entlast) "" (list 0 (+ (/ dm 2.0) (/ (- D dm) 4.0))) (list 100 (+ (/ dm 2.0) (/ (- D dm) 4.0))) "_Y")
  (ssadd (entlast) obj_to_del)
  (command "_revolve" (entlast) "" (list 0 0 0) (list 100 0 0) "360")    
  (command "_erase" obj_to_del "")
  )


(defun dT_make_inner_ring_80000 (D dm B r Dw n_balls D1 ax bx /
				 obj_to_del ring_thk init_dist)
  (setq obj_to_del (ssadd))
  (setq ring_thk (/ (/ (- D dm) 2.0) 3.0))
  (setq init_dist (- (/ D 2.0) r))
  (command "_pline"
	   (list (/ B 2.0) init_dist 0)
	   (list (- (/ B 2.0) r) (+ init_dist r) 0)
	   (list (- r (/ B 2.0)) (+ init_dist r) 0)
	   (list (- 0 (/ B 2.0)) init_dist 0)
	   (list (- 0 (/ B 2.0)) (- (+ init_dist r) (*(/ ring_thk 5) 4) 0))
	   (list (+ (- 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) (* (/ ring_thk 5) 4))  0)
	   (list (+ (- 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) ring_thk) 0)
	   (list (- (+ 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) ring_thk) 0)
	   (list (- (+ 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) (* (/ ring_thk 5) 4))  0)
	   (list (/ B 2.0) (- (+ init_dist r) (*(/ ring_thk 5) 4) 0))
	   "_c")
  (command "_mirror" (entlast) "" (list 0 (+ (/ dm 2.0) (/ (- D dm) 4.0))) (list 100 (+ (/ dm 2.0) (/ (- D dm) 4.0))) "_Y")
  (ssadd (entlast) obj_to_del)
  (command "_revolve" (entlast) "" (list 0 0 0) (list 100 0 0) "360")    
  (command "_erase" obj_to_del "")
  )


(defun dT_make_inner_ring_160000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_inner_ring_60000 D dm B r Dw n_balls D1 ax bx)
  )


(defun dT_make_inner_ring_180000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_inner_ring_80000 D dm B r Dw n_balls D1 ax bx)
  )


; ---------------------------------------------------------------------------
; --------------------------------Ring grooves-------------------------------
; ---------------------------------------------------------------------------

(defun dT_make_ring_groove_0 (D dm B r Dw n_balls D1 ax bx /
			      ring_thk coeff_sphere obj_to_del)
  (setq coeff_sphere 1.15)	; sphere coefficient
  (setq ring_thk (/ (/ (- D dm) 2.0) 3.0))
  (if
    (<= Dw 0)
    (setq Dw (* coeff_sphere ring_thk))
    )
  (command "_circle" (list 0 (+ (/ dm 2.0) (/ (- D dm) 4.0))) "_d" Dw)
  (setq obj_to_del (entlast))
  (command "_revolve" (entlast) "" (list 0 0 0) (list 100 0 0) "360")
  (command "_erase" obj_to_del "")
  )


(defun dT_make_ring_groove_60000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_ring_groove_0 D dm B r Dw n_balls D1 ax bx)
  )


(defun dT_make_ring_groove_80000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_ring_groove_0 D dm B r Dw n_balls D1 ax bx)
  )


(defun dT_make_ring_groove_160000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_ring_groove_0 D dm B r Dw n_balls D1 ax bx)
  )


(defun dT_make_ring_groove_180000 (D dm B r Dw n_balls D1 ax bx / )
  (dT_make_ring_groove_0 D dm B r Dw n_balls D1 ax bx)
  )

; ---------------------------------------------------------------------------
; ---------------------------------- Packs ----------------------------------
; ---------------------------------------------------------------------------

(defun dT_make_packR_0 (D dm B r Dw n_balls D1 ax bx / result)
  (setq result nil)
  )
       
(defun dT_make_packR_60000 (D dm B r Dw n_balls D1 ax bx /
			    ring_thk init_dist coeff_sphere obj_to_del)
  (setq obj_to_del (ssadd))
  (setq ring_thk (/ (/ (- D dm) 2.0) 3.0))
  (setq init_dist (- (/ D 2.0) r))
  (command "_pline"
	   (list (- (+ 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) (* (* (/ ring_thk 5) 4) (- 1 coeff_groove))  0))
	   (list (- (+ 0 (/ B 2.0))(* (/ B 5) (- 1 coeff_groove))) (- (+ init_dist r) (* (* (/ ring_thk 5) 4) (- 1 coeff_groove))  0))
	   (list (- (+ 0 (/ B 2.0))(* (/ B 5) (- 1 coeff_groove)))
		 (- (- (+ (/ dm 2) (/ (- D dm) 4.0)) (/ ring_thk 2)) (/ ring_thk 5))
		 0)
	   (list (- (+ 0 (/ B 2.0))(/ B 5))
		 (- (- (+ (/ dm 2) (/ (- D dm) 4.0)) (/ ring_thk 2)) (/ ring_thk 5))
		 0)
	   "_c")
  (ssadd (entlast) obj_to_del)
  (command "_revolve" (entlast) "" (list 0 0 0) (list 100 0 0) "360")
  (command "_erase" obj_to_del "")
  )


(defun dT_make_packR_80000 (D dm B r Dw n_balls D1 ax bx / )
(dT_make_packR_60000 D dm B r Dw n_balls D1 ax bx)
  )

(defun dT_make_packR_160000 (D dm B r Dw n_balls D1 ax bx / result)
  (dT_make_packR_60000 D dm B r Dw n_balls D1 ax bx)
  )

(defun dT_make_packR_180000 (D dm B r Dw n_balls D1 ax bx / result)
  (dT_make_packR_60000 D dm B r Dw n_balls D1 ax bx)
  )

(defun dT_make_packR_160000 (D dm B r Dw n_balls D1 ax bx / result)
  (dT_make_packR_60000 D dm B r Dw n_balls D1 ax bx)
  )

(defun dT_make_packR_180000 (D dm B r Dw n_balls D1 ax bx / result)
  (dT_make_packR_60000 D dm B r Dw n_balls D1 ax bx)
  )


(defun dT_make_packL_0 (D dm B r Dw n_balls D1 ax bx / result)
  (setq result nil)
  )


(defun dT_make_packL_60000 (D dm B r Dw n_balls D1 ax bx / result)
  (setq result nil)
  )


(defun dT_make_packL_80000 (D dm B r Dw n_balls D1 ax bx /
			    obj_to_del ring_thk init_dist)
  (setq obj_to_del (ssadd))
  (setq ring_thk (/ (/ (- D dm) 2.0) 3.0))
  (setq init_dist (- (/ D 2.0) r))
  (command "_pline"
	   (list (+ (- 0 (/ B 2.0))(/ B 5)) (- (+ init_dist r) (* (* (/ ring_thk 5) 4) (- 1 coeff_groove))  0))
	   (list (+ (- 0 (/ B 2.0))(* (/ B 5) (- 1 coeff_groove))) (- (+ init_dist r) (* (* (/ ring_thk 5) 4) (- 1 coeff_groove))  0))
	   (list (+ (- 0 (/ B 2.0))(* (/ B 5) (- 1 coeff_groove)))
		 (- (- (+ (/ dm 2) (/ (- D dm) 4.0)) (/ ring_thk 2)) (/ ring_thk 5))
		 0)
	   (list (+ (- 0 (/ B 2.0))(/ B 5))
		 (- (- (+ (/ dm 2) (/ (- D dm) 4.0)) (/ ring_thk 2)) (/ ring_thk 5))
		 0)
	   "_c")
  (ssadd (entlast) obj_to_del)
  (command "_revolve" (entlast) "" (list 0 0 0) (list 100 0 0) "360")
  (command "_erase" obj_to_del "")
  )


(defun dT_make_packL_160000 (D dm B r Dw n_balls D1 ax bx / result)
  (setq result nil)
  )


(defun dT_make_packL_180000 (D dm B r Dw n_balls D1 ax bx / result)
  (dT_make_packL_80000 D dm B r Dw n_balls D1 ax bx)
  )

