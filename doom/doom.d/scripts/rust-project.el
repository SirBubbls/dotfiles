(setq rust-default-cargo-toml "[package]\n\
name = \"%s\"\n\
version = \"0.1.0\"\n\
authors = [\"%s <%s>\"]\n\
edition = \"%s\"\n\
build = \"build.rs\"\n\
\n\
[dependencies]\n\
log = \"0.4.14\"\n\
simple_logger = \"1.11.0\"")

(setq rust-default-main-content "use log::info;\n\
\n\
\n\
fn main() {\n\
    log!(\"Hello World!\");
}")


(defun init-rust-project ()
  (interactive)
  (setq rust-init-directory (read-directory-name "Rust project root directory: "))
  (print! rust-init-directory)
  (if (y-or-n-p (s-concat "Do you want to initialize a rust project at: " rust-init-directory))
      (progn

        (make-directory rust-init-directory)

        ;; .gitignore
        (write-region "" nil
                      (concat (file-name-as-directory rust-init-directory) ".gitignore"))

        ;; default Cargo.toml
        (write-region (format! rust-default-cargo-toml
                         (read-string "Project Name: ")
                         user-full-name
                         user-mail-address
                         (format-time-string "%Y"))
                      nil
                      (concat (file-name-as-directory rust-init-directory) "Cargo.toml"))

        ;; empty build.rs
        (write-region ""
                      nil
                      (concat (file-name-as-directory rust-init-directory) "build.rs"))

        ;; default main
        (make-directory (concat rust-init-directory "/src"))
        (write-region rust-default-main-content
                      nil
                      (concat (file-name-as-directory rust-init-directory) "/src/main.rs"))

        ;; open main
        (switch-to-buffer (find-file-noselect
                           (concat (file-name-as-directory rust-init-directory) "/src/main.rs")
                           nil
                           nil
                           nil))
        )
      )
  )
