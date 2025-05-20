;; Provider Verification Contract
;; Validates healthcare entities on the blockchain

(define-data-var admin principal tx-sender)

;; Map to store verified providers
(define-map providers principal
  {
    name: (string-utf8 100),
    license-number: (string-utf8 50),
    specialty: (string-utf8 50),
    verified: bool
  }
)

;; Check if caller is admin
(define-private (is-admin)
  (is-eq tx-sender (var-get admin))
)

;; Register a new provider (admin only)
(define-public (register-provider (provider-principal principal) (name (string-utf8 100)) (license (string-utf8 50)) (specialty (string-utf8 50)))
  (begin
    (asserts! (is-admin) (err u403))
    (asserts! (not (is-some (map-get? providers provider-principal))) (err u100))
    (ok (map-set providers provider-principal {
      name: name,
      license-number: license,
      specialty: specialty,
      verified: false
    }))
  )
)

;; Verify a provider (admin only)
(define-public (verify-provider (provider-principal principal))
  (let ((provider-data (unwrap! (map-get? providers provider-principal) (err u404))))
    (begin
      (asserts! (is-admin) (err u403))
      (ok (map-set providers provider-principal
        (merge provider-data { verified: true })))
    )
  )
)

;; Check if a provider is verified
(define-read-only (is-verified-provider (provider-principal principal))
  (default-to false
    (get verified (map-get? providers provider-principal)))
)

;; Get provider details
(define-read-only (get-provider-details (provider-principal principal))
  (map-get? providers provider-principal)
)

;; Transfer admin rights
(define-public (transfer-admin (new-admin principal))
  (begin
    (asserts! (is-admin) (err u403))
    (ok (var-set admin new-admin))
  )
)
