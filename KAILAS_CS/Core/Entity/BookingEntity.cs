using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KAILAS_CS.Core.Entity
{
    public class BookingEntity
    {
        #region Declaration

        private long _bookingID;
        private Guid _guid;
        private Guid _userGUID;
        private string _bookingCode;
        private string _eventType;
        private DateTime _eventDate;
        private string _sessionType;
        private string _facilities;
        private short _guestCount;
        private Boolean _isPaymentSettled;
        private Boolean _isFreezed;
        private Boolean _isLocked;


        #endregion

        public BookingEntity()
        {
            _guid = Guid.Empty;
            _userGUID = Guid.Empty;
            _bookingCode = string.Empty;
            _eventType = string.Empty;
            _eventDate = DateTime.MinValue;
            _sessionType = string.Empty;
            _facilities = string.Empty;
            _guestCount = 0;
            _isPaymentSettled = false;
            _isFreezed = false;
            _isLocked = false;
        }

        public long BookingID
        {
            get { return _bookingID; }
            set { _bookingID = value; }
        }
        public Guid GUID
        {
            get { return _guid; }
            set { _guid = value; }
        }
        public string BookingCode
        {
            get { return _bookingCode; }
            set { _bookingCode = value; }
        }
        public Guid UserGuid
        {
            get { return _userGUID; }
            set { _userGUID = value; }
        }
        public string EventType
        {
            get { return _eventType; }
            set { _eventType = value; }
        }
        public DateTime EventDate
        {
            get { return _eventDate; }
            set { _eventDate = value; }
        }
        
        public string SessionType
        {
            get { return _sessionType; }
            set { _sessionType = value; }
        }
        public string Facilities
        {
            get { return _facilities; }
            set { _facilities = value; }
        }
        public short GuestCount
        {
            get { return _guestCount; }
            set { _guestCount = value; }
        }
        public Boolean IsFreezed
        {
            get { return _isFreezed; }
            set { _isFreezed = value; }
        }
        public Boolean IsPaymentSettled
        {
            get { return _isPaymentSettled; }
            set { _isPaymentSettled = value; }
        }
        public Boolean IsLocked
        {
            get { return _isLocked; }
            set { _isLocked = value; }
        }
    }
}