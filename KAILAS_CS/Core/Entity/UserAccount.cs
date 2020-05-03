using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlTypes;

namespace KAILAS_CS.Core.Entity
{
    public class UserAccount
    {
        #region Declaration

        private long _rowID;
        private Guid _guid;
        private string _firstName;
        private string _lastName;
        private string _gender;
        private DateTime _birthDate;
        private string _address1;
        private string _address2;
        private string _city;
        private string _district;
        private string _state;
        private string _country;
        private string _pin;
        private string _mobile;
        private string _email;
        private Boolean _isActive;

        #endregion

        public UserAccount()
        {
            _rowID = 0;
            _guid = Guid.Empty;
            _firstName = string.Empty;
            _lastName = string.Empty;
            _gender = string.Empty;
            _birthDate = (DateTime)SqlDateTime.MinValue;
            _address1 = string.Empty;
            _address2 = string.Empty;
            _city = string.Empty;
            _district = string.Empty;
            _state = string.Empty;
            _country = string.Empty;
            _pin = string.Empty;
            _mobile = string.Empty;
            _email = string.Empty;
            _isActive = false;
        }

        public long RowId
        {
            get { return _rowID; }
            set { _rowID = value; }
        }
        public Guid GUID
        {
            get { return _guid; }
            set { _guid = value; }
        }
        public string FirstName
        {
            get { return _firstName; }
            set { _firstName = value; }
        }
        public string LastName
        {
            get { return _lastName; }
            set { _lastName = value; }
        }
        public string Address2
        {
            get { return _address2; }
            set { _address2 = value; }
        }
        public string City
        {
            get { return _city; }
            set { _city = value; }
        }
        public string District
        {
            get { return _district; }
            set { _district = value; }
        }
        public string State
        {
            get { return _state; }
            set { _state = value; }
        }
        public string Country
        {
            get { return _country; }
            set { _country = value; }
        }
        public string Pin
        {
            get { return _pin; }
            set { _pin = value; }
        }
        public string Mobile
        {
            get { return _mobile; }
            set { _mobile = value; }
        }
        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }
        public Boolean IsActive
        {
            get { return _isActive; }
            set { _isActive = value; }

        }
    }
}