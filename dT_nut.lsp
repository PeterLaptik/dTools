(defun c:SetNutDirection()
  (setq pt1 (getpoint "\nEnter point"))
  (setq pt2 (getpoint "\nEnter direction"))
  (setq myObj (c:dT-nutType2))
  (command "_ucs" "_zaxis" pt1 pt2)
  (command "_pasteclip" (list 0 0 0))
  (command "_ucs" "_p")
  )

(defun c:dT-nutType1 ()
  (command "_ucs" "")
  (setq osmode_old_ (getvar "osmode"))
  (setvar "osmode" 0)
  (setq myNut nil)
  (setq extractMe nil)
  (setq s 5.0)
  (setq m 2.0)
  (setq dw 4.5)
  (setq Dm 2.5)
  (setq alphaAngle 30)
  (command "_polygon" "6" (list 0 0 0) "_c" (rtos (/ s 2)))
  (command "_extrude" (entlast) "" (rtos m))
  (setq myNut (entlast))
  (command "_3dpoly"
	   (list 0 (/ dw 2) m)
	   (list 0 (/ (* 1.16 s) 2) m)		; exactly = 1.1547
	   (list 0 (/ (* 1.16 s) 2) (- m
				       (/
					 (*
					   (/
					     (sin (/ (* alphaAngle PI) 180))
					     (cos (/ (* alphaAngle PI) 180))
					     )
					   (- (* 1.1547 s) dw)
					   )
					 2)
				       ))
	   "_c"
	   )
  (command "_revolve" (entlast) "" (list 0 0 0) (list 0 0 m) "360")
  (setq extractMe (entlast))
  (command "_subtract"  myNut "" extractMe "")
  (command "_3dpoly"
	   (list 0 (/ dw 2) 0)
	   (list 0 (/ (* 1.16 s) 2) 0)		; exactly = 1.1547
	   (list 0 (/ (* 1.16 s) 2) (+ 0
				       (/
					 (*
					   (/
					     (sin (/ (* alphaAngle PI) 180))
					     (cos (/ (* alphaAngle PI) 180))
					     )
					   (- (* 1.1547 s) dw)
					   )
					 2)
				       ))
	   "_c"
	   )
  (command "_revolve" (entlast) "" (list 0 0 0) (list 0 0 m) "360")
  (setq extractMe (entlast))
  (command "_subtract"  myNut "" extractMe "")
  (command "_cylinder" (list 0 0 0) "_D" (rtos Dm) (rtos m))
  (setq extractMe (entlast))
  (command "_subtract"  myNut "" extractMe "")
  (command "_copybase" (list 0 0 0) (entlast) "")
  (command "_erase" (entlast) "")
  (setvar "osmode" osmode_old_)
  (command "_ucs" "_p")
  )

(defun c:dT-nutType2 ()
  (command "_ucs" "")
  (setq osmode_old_ (getvar "osmode"))
  (setvar "osmode" 0)
  (setq myNut nil)
  (setq extractMe nil)
  (setq s 5.0)
  (setq m 2.0)
  (setq dw 4.5)
  (setq Dm 2.5)
  (setq alphaAngle 30)
  (command "_polygon" "6" (list 0 0 0) "_c" (rtos (/ s 2)))
  (command "_extrude" (entlast) "" (rtos m))
  (setq myNut (entlast))
  (command "_3dpoly"
	   (list 0 (/ dw 2) m)
	   (list 0 (/ (* 1.16 s) 2) m)		; exactly = 1.1547
	   (list 0 (/ (* 1.16 s) 2) (- m
				       (/
					 (*
					   (/
					     (sin (/ (* alphaAngle PI) 180))
					     (cos (/ (* alphaAngle PI) 180))
					     )
					   (- (* 1.1547 s) dw)
					   )
					 2)
				       ))
	   "_c"
	   )
  (command "_revolve" (entlast) "" (list 0 0 0) (list 0 0 m) "360")
  (setq extractMe (entlast))
  (command "_subtract"  myNut "" extractMe "")
  (command "_cylinder" (list 0 0 0) "_D" (rtos Dm) (rtos m))
  (setq extractMe (entlast))
  (command "_subtract"  myNut "" extractMe "")
  (command "_copybase" (list 0 0 0) (entlast) "")
  (command "_erase" (entlast) "")
  (setvar "osmode" osmode_old_)
  (command "_ucs" "_p")
  )

(defun c:dT-nutType3 ()
  (command "_ucs" "")
  (setq osmode_old_ (getvar "osmode"))
  (setvar "osmode" 0)
  (setq myNut nil)
  (setq cylPart nil)
  (setq extractMe nil)
  (setq s 5.0)
  (setq m 2.0)
  (setq dw 4.5)
  (setq Dm 2.5)
  (setq hw 0.3)
  (setq alphaAngle 30)
  (command "_polygon" "6" (list 0 0 hw) "_c" (rtos (/ s 2)))
  (command "_extrude" (entlast) "" (rtos (- m hw)))
  (setq myNut (entlast))
  (command "_cylinder" (list 0 0 0) "_D" (rtos dw) (rtos hw))
  (setq cylPart (entlast))
  (command "_union" myNut cylPart "")
  (setq myNut (entlast))
  (command "_3dpoly"
	   (list 0 (/ dw 2) m)
	   (list 0 (/ (* 1.16 s) 2) m)		; exactly = 1.1547
	   (list 0 (/ (* 1.16 s) 2) (- m
				       (/
					 (*
					   (/
					     (sin (/ (* alphaAngle PI) 180))
					     (cos (/ (* alphaAngle PI) 180))
					     )
					   (- (* 1.1547 s) dw)
					   )
					 2)
				       ))
	   "_c"
	   )
  (command "_revolve" (entlast) "" (list 0 0 0) (list 0 0 m) "360")
  (setq extractMe (entlast))
  (command "_subtract"  myNut "" extractMe "")
  (command "_cylinder" (list 0 0 0) "_D" (rtos Dm) (rtos m))
  (setq extractMe (entlast))
  (command "_subtract"  myNut "" extractMe "")
  (command "_copybase" (list 0 0 0) (entlast) "")
  (command "_erase" (entlast) "")
  (setvar "osmode" osmode_old_)
  (command "_ucs" "_p")
  )