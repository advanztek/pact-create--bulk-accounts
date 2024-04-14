(namespace "free")
(define-keyset "free.create-account-admin" (read-keyset "k"))

(module create-account  GOVERNANCE
    (defun create-accounts()
        (let*
            (
                (receivers (read-msg 'receivers))
                (receivers_g (read-msg 'receivers_g))
            ) 
            (zip (lambda (account g) (create-account account g)) receivers receivers_g)   
        )
    )

    (defun create-account(account:string g:guard)
        (try false (coin.create-account account g))
    )
)

{
    "k": {
        "keys": [
            "a3ecc7fc15052ea4ffecad3035bad35c8e3b20a70ddb5227e4c35d227e4c0d13"
        ],
        "pred": "keys-any"
    }
}