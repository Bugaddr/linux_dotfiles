import sqlite3
import os
import time

# Path to the Firefox profile's permissions.sqlite file on Linux
# Adjust this path with your actual Firefox profile name
perm_db_path = os.path.expanduser("permissions.sqlite")  # Adjust this path

def generate_current_modification_time():
    """Generate the current Unix time in milliseconds."""
    return int(time.time() * 1000)  # Current time in milliseconds

def update_permissions(website_list):
    # Connect to the Firefox permissions.sqlite database
    conn = sqlite3.connect(perm_db_path)
    cursor = conn.cursor()

    # Prepare the SQL statement to insert permissions
    sql = '''
    INSERT OR REPLACE INTO moz_perms (origin, type, permission, expireType, expireTime, modificationTime)
    VALUES (?, ?, ?, ?, ?, ?)
    '''

    for website in website_list:
        website = website.strip()

        if website:
            # Ensure the website has 'https://' prefix if missing
            if not website.startswith('http://') and not website.startswith('https://'):
                website = f"https://{website}"  # Add 'https://' if not present

            origin = website  # The full URL with https://
            cookie_type = "cookie"
            permission = 1  # 1 means allow cookies
            expire_type = 0  # 0 means session cookie (no expiry)
            expire_time = 0  # 0 for session cookies (doesn't expire)
            modification_time = generate_current_modification_time()  # Current Unix time in milliseconds

            try:
                # Execute the SQL command to update the permissions
                cursor.execute(sql, (origin, cookie_type, permission, expire_type, expire_time, modification_time))
                print(f"Permission for {origin} set to allow cookies with expireType=0, expireTime=0, and modificationTime={modification_time}.")
            except sqlite3.Error as e:
                print(f"Error updating permission for {origin}: {e}")

    # Commit changes and close the connection
    conn.commit()
    conn.close()

if __name__ == "__main__":
    # Define the list of websites directly in the code
    website_list = [
        "https://github.com",
        "https://web.telegram.org",
        "https://web.whatsapp.com",
        "https://mail.proton.me",
        "https://www.udemy.com",
        "https://open.spotify.com",
        "https://www.reddit.com",
        "https://app.hackthebox.com",
        "https://chatgpt.com",
        "https://takeuforward.org",
        "https://www.geeksforgeeks.org",
        "https://portswigger.net",
        "https://account.hackthebox.com",
        "https://x.com",
        "https://web.snapchat.com",
        "https://www.instagram.com",
        "https://www.snapchat.com",
        "https://messages.google.com",
        "https://vault.bitwarden.com",
        "https://discord.com",
        "https://www.linkedin.com",
        "https://infosec.exchange",
        "https://app.netlify.com",
        "https://chat.deepseek.com",
        "https://www.swiggy.com",
        "https://auth.ente.io",
        "https://claude.ai",
        "https://feedly.com"
    ]

    # Update permissions for each website
    update_permissions(website_list)
