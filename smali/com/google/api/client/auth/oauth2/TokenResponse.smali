.class public Lcom/google/api/client/auth/oauth2/TokenResponse;
.super Lcom/google/api/client/json/GenericJson;
.source "TokenResponse.java"


# instance fields
.field private accessToken:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "access_token"
    .end annotation
.end field

.field private expiresInSeconds:Ljava/lang/Long;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "expires_in"
    .end annotation
.end field

.field private refreshToken:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "refresh_token"
    .end annotation
.end field

.field private scope:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private tokenType:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
        value = "token_type"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lcom/google/api/client/json/GenericJson;-><init>()V

    return-void
.end method


# virtual methods
.method public final getAccessToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/google/api/client/auth/oauth2/TokenResponse;->accessToken:Ljava/lang/String;

    return-object v0
.end method

.method public final getExpiresInSeconds()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcom/google/api/client/auth/oauth2/TokenResponse;->expiresInSeconds:Ljava/lang/Long;

    return-object v0
.end method

.method public final getRefreshToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lcom/google/api/client/auth/oauth2/TokenResponse;->refreshToken:Ljava/lang/String;

    return-object v0
.end method

.method public final getScope()Ljava/lang/String;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lcom/google/api/client/auth/oauth2/TokenResponse;->scope:Ljava/lang/String;

    return-object v0
.end method

.method public final getTokenType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/google/api/client/auth/oauth2/TokenResponse;->tokenType:Ljava/lang/String;

    return-object v0
.end method

.method public setAccessToken(Ljava/lang/String;)Lcom/google/api/client/auth/oauth2/TokenResponse;
    .locals 1
    .parameter "accessToken"

    .prologue
    .line 81
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/google/api/client/auth/oauth2/TokenResponse;->accessToken:Ljava/lang/String;

    .line 82
    return-object p0
.end method

.method public setExpiresInSeconds(Ljava/lang/Long;)Lcom/google/api/client/auth/oauth2/TokenResponse;
    .locals 0
    .parameter "expiresInSeconds"

    .prologue
    .line 125
    iput-object p1, p0, Lcom/google/api/client/auth/oauth2/TokenResponse;->expiresInSeconds:Ljava/lang/Long;

    .line 126
    return-object p0
.end method

.method public setRefreshToken(Ljava/lang/String;)Lcom/google/api/client/auth/oauth2/TokenResponse;
    .locals 0
    .parameter "refreshToken"

    .prologue
    .line 147
    iput-object p1, p0, Lcom/google/api/client/auth/oauth2/TokenResponse;->refreshToken:Ljava/lang/String;

    .line 148
    return-object p0
.end method

.method public setScope(Ljava/lang/String;)Lcom/google/api/client/auth/oauth2/TokenResponse;
    .locals 0
    .parameter "scope"

    .prologue
    .line 167
    iput-object p1, p0, Lcom/google/api/client/auth/oauth2/TokenResponse;->scope:Ljava/lang/String;

    .line 168
    return-object p0
.end method

.method public setTokenType(Ljava/lang/String;)Lcom/google/api/client/auth/oauth2/TokenResponse;
    .locals 1
    .parameter "tokenType"

    .prologue
    .line 103
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/google/api/client/auth/oauth2/TokenResponse;->tokenType:Ljava/lang/String;

    .line 104
    return-object p0
.end method
