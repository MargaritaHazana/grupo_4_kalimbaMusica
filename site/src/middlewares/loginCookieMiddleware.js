module.exports = function authCookie(req,res,next){
    if (req.session.userID || req.cookies.userIdCookie) {
        if (req.session.userID) {
            req.session.userID = req.session.userID
        } else {
            req.session.userID = req.cookies.userIDCookie
        }
    }
    next()
}