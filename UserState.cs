public class UserState
{
    public bool IsLoggedIn { get; private set; }
    public string Username { get; private set; } = "";

    public event Action? OnChange;

    public void SetUser(string username)
    {
        Username = username;
        IsLoggedIn = true;
        NotifyStateChanged();
    }

    public void Logout()
    {
        Username = "";
        IsLoggedIn = false;
        NotifyStateChanged();
    }

    private void NotifyStateChanged() => OnChange?.Invoke();
}
