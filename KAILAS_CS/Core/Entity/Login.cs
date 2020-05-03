using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAILAS_CS.Core.Entity
{
    public class Login
    {
        #region Declaration

        private string _userName;
        private string _password;
        private Guid _loginGUID;
        private string _userType;
        private Boolean _isLocked;

        #endregion

        public Login()
        {
            _userName = string.Empty;
            _password = string.Empty;
            _loginGUID = Guid.Empty;
            _userType = string.Empty;
            _isLocked = false;
        }

        public string UserName
        {
            get { return _userName; }
            set { _userName = value; }
        }
        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }
        public Guid LoginGUID
        {
            get { return _loginGUID; }
            set { _loginGUID = value; }
        }       
        public string UserType
        {
            get { return _userType; }
            set { _userType = value; }
        }

        public Boolean IsLocked
        {
            get { return _isLocked; }
            set { _isLocked = value; }
        }
    }
}