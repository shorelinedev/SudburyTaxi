.class public final Lcom/google/common/net/HostAndPort;
.super Ljava/lang/Object;
.source "HostAndPort.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation build Lcom/google/common/annotations/Beta;
.end annotation

.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# static fields
.field private static final BRACKET_PATTERN:Ljava/util/regex/Pattern; = null

.field private static final NO_PORT:I = -0x1

.field private static final serialVersionUID:J


# instance fields
.field private final hasBracketlessColons:Z

.field private final host:Ljava/lang/String;

.field private final port:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 139
    const-string v0, "^\\[(.*:.*)\\](?::(\\d*))?$"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/HostAndPort;->BRACKET_PATTERN:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IZ)V
    .locals 0
    .parameter "host"
    .parameter "port"
    .parameter "hasBracketlessColons"

    .prologue
    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 80
    iput-object p1, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    .line 81
    iput p2, p0, Lcom/google/common/net/HostAndPort;->port:I

    .line 82
    iput-boolean p3, p0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    .line 83
    return-void
.end method

.method public static fromParts(Ljava/lang/String;I)Lcom/google/common/net/HostAndPort;
    .locals 4
    .parameter "host"
    .parameter "port"

    .prologue
    .line 133
    invoke-static {p1}, Lcom/google/common/net/HostAndPort;->isValidPort(I)Z

    move-result v1

    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 134
    invoke-static {p0}, Lcom/google/common/net/HostAndPort;->fromString(Ljava/lang/String;)Lcom/google/common/net/HostAndPort;

    move-result-object v0

    .line 135
    .local v0, parsedHost:Lcom/google/common/net/HostAndPort;
    invoke-virtual {v0}, Lcom/google/common/net/HostAndPort;->hasPort()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 136
    new-instance v1, Lcom/google/common/net/HostAndPort;

    iget-object v2, v0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    iget-boolean v3, v0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    invoke-direct {v1, v2, p1, v3}, Lcom/google/common/net/HostAndPort;-><init>(Ljava/lang/String;IZ)V

    return-object v1

    .line 135
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static fromString(Ljava/lang/String;)Lcom/google/common/net/HostAndPort;
    .locals 12
    .parameter "hostPortString"

    .prologue
    const/16 v10, 0x3a

    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 152
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    const/4 v6, 0x0

    .line 155
    .local v6, portString:Ljava/lang/String;
    const/4 v2, 0x0

    .line 157
    .local v2, hasBracketlessColons:Z
    const-string v9, "["

    invoke-virtual {p0, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 159
    sget-object v9, Lcom/google/common/net/HostAndPort;->BRACKET_PATTERN:Ljava/util/regex/Pattern;

    invoke-virtual {v9, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 160
    .local v4, matcher:Ljava/util/regex/Matcher;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v9

    const-string v10, "Invalid bracketed host/port: %s"

    new-array v11, v7, [Ljava/lang/Object;

    aput-object p0, v11, v8

    invoke-static {v9, v10, v11}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 161
    invoke-virtual {v4, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    .line 162
    .local v3, host:Ljava/lang/String;
    const/4 v9, 0x2

    invoke-virtual {v4, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    .line 176
    .end local v4           #matcher:Ljava/util/regex/Matcher;
    :goto_0
    const/4 v5, -0x1

    .line 177
    .local v5, port:I
    invoke-static {v6}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 180
    const-string v9, "+"

    invoke-virtual {v6, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_4

    move v9, v7

    :goto_1
    const-string v10, "Unparseable port number: %s"

    new-array v11, v7, [Ljava/lang/Object;

    aput-object p0, v11, v8

    invoke-static {v9, v10, v11}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 182
    :try_start_0
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    .line 186
    invoke-static {v5}, Lcom/google/common/net/HostAndPort;->isValidPort(I)Z

    move-result v9

    const-string v10, "Port number out of range: %s"

    new-array v7, v7, [Ljava/lang/Object;

    aput-object p0, v7, v8

    invoke-static {v9, v10, v7}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 189
    :cond_0
    new-instance v7, Lcom/google/common/net/HostAndPort;

    invoke-direct {v7, v3, v5, v2}, Lcom/google/common/net/HostAndPort;-><init>(Ljava/lang/String;IZ)V

    return-object v7

    .line 164
    .end local v3           #host:Ljava/lang/String;
    .end local v5           #port:I
    :cond_1
    invoke-virtual {p0, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 165
    .local v0, colonPos:I
    if-ltz v0, :cond_2

    add-int/lit8 v9, v0, 0x1

    invoke-virtual {p0, v10, v9}, Ljava/lang/String;->indexOf(II)I

    move-result v9

    const/4 v10, -0x1

    if-ne v9, v10, :cond_2

    .line 167
    invoke-virtual {p0, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 168
    .restart local v3       #host:Ljava/lang/String;
    add-int/lit8 v9, v0, 0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_0

    .line 171
    .end local v3           #host:Ljava/lang/String;
    :cond_2
    move-object v3, p0

    .line 172
    .restart local v3       #host:Ljava/lang/String;
    if-ltz v0, :cond_3

    move v2, v7

    :goto_2
    goto :goto_0

    :cond_3
    move v2, v8

    goto :goto_2

    .end local v0           #colonPos:I
    .restart local v5       #port:I
    :cond_4
    move v9, v8

    .line 180
    goto :goto_1

    .line 183
    :catch_0
    move-exception v1

    .line 184
    .local v1, e:Ljava/lang/NumberFormatException;
    new-instance v7, Ljava/lang/IllegalArgumentException;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unparseable port number: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method private static isValidPort(I)Z
    .locals 1
    .parameter "port"

    .prologue
    .line 266
    if-ltz p0, :cond_0

    const v0, 0xffff

    if-gt p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "other"
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end parameter

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 232
    if-ne p0, p1, :cond_1

    .line 241
    :cond_0
    :goto_0
    return v1

    .line 235
    :cond_1
    instance-of v3, p1, Lcom/google/common/net/HostAndPort;

    if-eqz v3, :cond_3

    move-object v0, p1

    .line 236
    check-cast v0, Lcom/google/common/net/HostAndPort;

    .line 237
    .local v0, that:Lcom/google/common/net/HostAndPort;
    iget-object v3, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    iget-object v4, v0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget v3, p0, Lcom/google/common/net/HostAndPort;->port:I

    iget v4, v0, Lcom/google/common/net/HostAndPort;->port:I

    if-ne v3, v4, :cond_2

    iget-boolean v3, p0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    iget-boolean v4, v0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    if-eq v3, v4, :cond_0

    :cond_2
    move v1, v2

    goto :goto_0

    .end local v0           #that:Lcom/google/common/net/HostAndPort;
    :cond_3
    move v1, v2

    .line 241
    goto :goto_0
.end method

.method public getHostText()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    return-object v0
.end method

.method public getPort()I
    .locals 1

    .prologue
    .line 109
    invoke-virtual {p0}, Lcom/google/common/net/HostAndPort;->hasPort()Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 110
    iget v0, p0, Lcom/google/common/net/HostAndPort;->port:I

    return v0
.end method

.method public getPortOrDefault(I)I
    .locals 1
    .parameter "defaultPort"

    .prologue
    .line 117
    invoke-virtual {p0}, Lcom/google/common/net/HostAndPort;->hasPort()Z

    move-result v0

    if-eqz v0, :cond_0

    iget p1, p0, Lcom/google/common/net/HostAndPort;->port:I

    .end local p1
    :cond_0
    return p1
.end method

.method public hasPort()Z
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lcom/google/common/net/HostAndPort;->port:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 246
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget v2, p0, Lcom/google/common/net/HostAndPort;->port:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-boolean v2, p0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/google/common/base/Objects;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public requireBracketsForIPv6()Lcom/google/common/net/HostAndPort;
    .locals 5

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 226
    iget-boolean v0, p0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    const-string v3, "Possible bracketless IPv6 literal: %s"

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    aput-object v4, v1, v2

    invoke-static {v0, v3, v1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 227
    return-object p0

    :cond_0
    move v0, v2

    .line 226
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0x3a

    .line 252
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0x7

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 253
    .local v0, builder:Ljava/lang/StringBuilder;
    iget-object v1, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_1

    .line 254
    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x5d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 258
    :goto_0
    invoke-virtual {p0}, Lcom/google/common/net/HostAndPort;->hasPort()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 259
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/google/common/net/HostAndPort;->port:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 261
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 256
    :cond_1
    iget-object v1, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method public withDefaultPort(I)Lcom/google/common/net/HostAndPort;
    .locals 3
    .parameter "defaultPort"

    .prologue
    .line 203
    invoke-static {p1}, Lcom/google/common/net/HostAndPort;->isValidPort(I)Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 204
    invoke-virtual {p0}, Lcom/google/common/net/HostAndPort;->hasPort()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/google/common/net/HostAndPort;->port:I

    if-ne v0, p1, :cond_1

    .line 207
    .end local p0
    :cond_0
    :goto_0
    return-object p0

    .restart local p0
    :cond_1
    new-instance v0, Lcom/google/common/net/HostAndPort;

    iget-object v1, p0, Lcom/google/common/net/HostAndPort;->host:Ljava/lang/String;

    iget-boolean v2, p0, Lcom/google/common/net/HostAndPort;->hasBracketlessColons:Z

    invoke-direct {v0, v1, p1, v2}, Lcom/google/common/net/HostAndPort;-><init>(Ljava/lang/String;IZ)V

    move-object p0, v0

    goto :goto_0
.end method
