(defun as-list (obj)
  (if (atom obj)
      (list obj)
      obj))

(defun as-string (obj)
  (princ-to-string obj))

(defun as-function (obj)
  (constantly obj))

(defun as-keyword (obj)
  (typecase obj
    (string 
     (read-from-string (if (char= #\: (elt obj 0))
				  obj
				  (concatenate 'string ":" obj))))
    (symbol 
     (if (keywordp obj)
	 obj
	 (read-from-string
	  (concatenate 'string
		       ":"
		       (symbol-name obj)))))))




