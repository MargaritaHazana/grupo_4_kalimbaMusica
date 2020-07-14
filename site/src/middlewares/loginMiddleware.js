module.exports = function authMiddleware(req,res,next){
    if(req.session.userID == undefined ){
        req.session.path = req.path;
        return res.redirect('/users/login');
    }
    next()
}