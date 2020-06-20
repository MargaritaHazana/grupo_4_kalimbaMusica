module.exports = function authCookie(req,res,next){
    if (req.session.userId || req.cookies.userIdCookie) {
        req.session.userId = req.session.userId ?  req.session.userId : req.cookies.userIdCookie
        
    }
    
    next()
}